Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BED55BBD3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CCB11B33C;
	Mon, 27 Jun 2022 19:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED7F11B31B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656358979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LmREPT/CJYaHcZ5uL+xmp5wGDyToSARasqjtfBi5A5A=;
 b=bxfbauflmM/7kiyUxfUA8lpQq42lvM0K+qbn/qNWtXQ6lvFN4UmFMxV+11B/ysUgZn9V/l
 7y8bojqfQ8jgWiZuPGUFLFPKASQpZpBlRob7ZjtqvK2n1mOE2Y8AoA+VJtp/qBeSfsdMh6
 O6HgEWHx2BjZADIZKjk50kjf3tPIjI0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-zvXrQjGtMV6AQJ_ZyvBfdw-1; Mon, 27 Jun 2022 15:42:58 -0400
X-MC-Unique: zvXrQjGtMV6AQJ_ZyvBfdw-1
Received: by mail-qk1-f198.google.com with SMTP id
 ay8-20020a05620a178800b006a76e584761so11124431qkb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=LmREPT/CJYaHcZ5uL+xmp5wGDyToSARasqjtfBi5A5A=;
 b=BeROvqqJIHz69UnR+vwHiO6BJsTWD530MC3DihAWZ+aW2DAvGCH0+DkxFJYtIQfzQ3
 ncT8C7jifJy8Cidnds/06BbqO5n9xBqwwWyvCMur3eIRMy6XTT0BZ+HhWwUogQ2vCq8e
 9a4XJnXMJvAJt1ehHFGQoS3GCS38dRYp4tJRypkK/RVRWQV+5NYd4Kclz/m8NgtQQHZ3
 cgxI/9B7Yj2wHsOAWOlLlUMBRjrNoikSp7IiphL9oGg8CYEUFYIbgJ1WURlAPsWb/vcm
 rzWMZZVIE1TelA/OUI3BPNMBM1WIS00FsumfY0y7ykC2RRysOcKDUZYDDUUMlARM3JML
 D4EQ==
X-Gm-Message-State: AJIora8Pogkou2OCxuQwQJfKMhgsuiACb41LHkxqINWC25IONIBhoR4y
 kAtV8OL2T6vi1kqyYDSnUrHU/ARXWITM2iC32JEinXKsxCs9ui4LcktjUeZvCW3Va9S+siXEwso
 jnSHJWBHtPJC1lKmzNkanHW6O2QDKlEw65Us7e5kLM8bcHXGzK4sTCYHfQkR13BYOC9no0tYVzX
 oo
X-Received: by 2002:a05:6214:c66:b0:470:5251:cb4d with SMTP id
 t6-20020a0562140c6600b004705251cb4dmr10104440qvj.131.1656358977850; 
 Mon, 27 Jun 2022 12:42:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9Y9CMTLcVg6ELQ5aMBP6b3fTxrJpnPjJRoVd64fBaAQ8vxuuHEMW+cIO2rbHPghg57+DPPw==
X-Received: by 2002:a05:6214:c66:b0:470:5251:cb4d with SMTP id
 t6-20020a0562140c6600b004705251cb4dmr10104428qvj.131.1656358977509; 
 Mon, 27 Jun 2022 12:42:57 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 s9-20020ac85289000000b00304efba3d84sm7612505qtn.25.2022.06.27.12.42.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:42:57 -0700 (PDT)
Message-ID: <9e4458d0933877ebc08a970af70692494a2d4ebb.camel@redhat.com>
Subject: XDC 2022: Registration & Call for Presentations still open!
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Date: Mon, 27 Jun 2022 15:42:56 -0400
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

