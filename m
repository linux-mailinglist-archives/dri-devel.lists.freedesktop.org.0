Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6172953D27B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 21:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C70110FD8E;
	Fri,  3 Jun 2022 19:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9B710FD8E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 19:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654285681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qhN+6H64TiG7vRtiCb0Q48wOxyAX3Dt/H1qpOXDv8ac=;
 b=eMVd6FSI84aL8ptC+7dlYbjoF9DEzRZ57cYCrXhoy5jB6epi0HTnOevr0RU/gwAwL+NwYW
 vGQBnEOnGs7GBfBNiJoBcGfYUwIfAFExESKV8nWE0uBi5aL6qHWkP/ZbkqXXqwjn3MUTzn
 NcrKRPBZDtt62JbM4AN3PIMzmcJacyk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-7wgT12oiOQqowpqvwPmaAQ-1; Fri, 03 Jun 2022 15:48:00 -0400
X-MC-Unique: 7wgT12oiOQqowpqvwPmaAQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay1-20020a05600c1e0100b0039c3a3fc6a4so1853220wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 12:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=qhN+6H64TiG7vRtiCb0Q48wOxyAX3Dt/H1qpOXDv8ac=;
 b=Mwh0c5Jb2VKIrRJSnx/Vn5RbS9Cd7YZpKPtTuk/REF3k6uVSnQRtQYpfffJAZx2V0n
 MSkFgctNsmFp4me69BjgC4emervRfa7PZmkClxd2eI+KvNSEcurLFi06cGLF41J0zqxk
 Gd/YSJbwZqQx1KDRa1AzZ/Y6VT2kvdUIWbbkVcDl97QHtQwTrvUNJoyuOQ98vsPFFWdj
 FAXl9FiuI9O+DAhiEZFy9unItnZam2ktbLMph7NyDDMlqJQJzqgN8YSPmQXAFlc7RbPQ
 RIjjS2yDmiZ9T/VRuc49IZSEYeECC3tPE3CViv3rHUIG75I4kjng9PY6y59CaY3rxZzj
 SlLw==
X-Gm-Message-State: AOAM531UMnRHQlvjMiPLm+P0B3zLQY1V6Zu0vzlNAeU5R9kGqbD3TC9w
 MtwzPX4pINquvkSAphAcW6jSHBXNGj9CZiKsI+LQKk9Glq/ZgKI17PbsudfSZn25Uxxk5RwxgeD
 3PqLhBwOCIZOreZpFxAdhDgobljexDM+WZ15/2akZCnjiBxBGTEvtfZk9R+P2d5mQwTbA4dzOon
 19
X-Received: by 2002:a7b:c449:0:b0:397:4714:bf56 with SMTP id
 l9-20020a7bc449000000b003974714bf56mr38851794wmi.108.1654285679261; 
 Fri, 03 Jun 2022 12:47:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1BNgqTOAgWqBs6VG56jctRYwLY5R3XSOioCkfuC/jBibcy5VgrCaBa7bXTrOSkImO7Qii5g==
X-Received: by 2002:a7b:c449:0:b0:397:4714:bf56 with SMTP id
 l9-20020a7bc449000000b003974714bf56mr38851775wmi.108.1654285678886; 
 Fri, 03 Jun 2022 12:47:58 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c2cad00b00397623ff335sm10270282wmc.10.2022.06.03.12.47.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 12:47:58 -0700 (PDT)
Message-ID: <04817f51dc284f3347c53002601783b96ef0cb90.camel@redhat.com>
Subject: XDC 2022: Registration & Call for Presentations still open!
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 03 Jun 2022 15:47:56 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello! This is just a reminder that the CFP for XDC in 2022 is still open!

The 2022 X.Org Developers Conference is being held in conjunction with
the 2022 Wine Developers Conference.  This is a meeting to bring
together developers working on all things open graphics (Linux kernel,
Mesa, DRM, Wayland, X11, etc.) as well as developers for the Wine
Project, a key consumer of open graphics.

Registration & Call for Proposals are now open for both XDC 2022 and
WineConf 2022, which will take place on October 4-6, 2022 in
Minneapolis, Minnesota, USA. 

https://xdc2022.x.org
 
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!
 
In order to register as attendee, you will therefore need to do it via
the XDC website:
 
https://indico.freedesktop.org/event/2/registrations/2/
 
In addition to registration, the CfP is now open for talks, workshops
and demos at XDC 2022. While any serious proposal will be gratefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.
 
We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more: 
 
https://indico.freedesktop.org/event/2/abstracts/
 
The deadline for submissions is Monday July 4th, 2022.
 
Check out our Reimbursement Policy to accept speaker
expenses for X.Org events like XDC 2022:
 
https://www.x.org/wiki/XorgFoundation/Policies/Reimbursement/

If you have any questions, please send me an email to
xdc@codeweavers.com, adding on CC the X.org board (board
at foundation.x.org).
 
And don't forget, you can follow us on Twitter for all the latest
updates and to stay connected:
 
https://twitter.com/XOrgDevConf

Best regards,
Lyude Paul, on behalf of X.org


-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

