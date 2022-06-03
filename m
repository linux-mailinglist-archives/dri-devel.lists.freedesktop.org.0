Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F13B53D277
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 21:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FD210FB10;
	Fri,  3 Jun 2022 19:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CA910FB10
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 19:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654285609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qhN+6H64TiG7vRtiCb0Q48wOxyAX3Dt/H1qpOXDv8ac=;
 b=Hq25o+PktCFaeavHWlNkH9FYwMGTA4ivaCkxriCVYyRHByTzZ65QMxwLvPAxi5zUiXgtjp
 ++OlsUowWCy+67zbsspWMoIduwM1qGmynSG0DhsGWmgnvSngfGSzBhWUx+XX+1kRG4qYrQ
 j5FIzd5oK2jfGFXO1GW6J+GrMX04ZpU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-LFF-mbD9NBywTVPd8Bal_w-1; Fri, 03 Jun 2022 15:46:48 -0400
X-MC-Unique: LFF-mbD9NBywTVPd8Bal_w-1
Received: by mail-wm1-f70.google.com with SMTP id
 o3-20020a05600c4fc300b003946a9764baso7227388wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 12:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=qhN+6H64TiG7vRtiCb0Q48wOxyAX3Dt/H1qpOXDv8ac=;
 b=DNJmHJhU7hjG4Gr1NByrlisXSJz+55qfVSXF/lnrjimtra/uwmBux1bz7iooUKcDPE
 lJaNhNzvL5NANRzi6qGDf4fUUpBo2ixK3GsSwOzOCDemv+mGaQpwTH9udrvKOuiFyLj3
 7y6881WrkV1TzAg2e6mNJ4/Sm8XRKDm0s4eFC1B9mu0ZoLzN+T6z47//+AwG4C/VAK9j
 1g9b9AN1FWvxhyuTM3elrblHXvdCDAKVLCfD12NymhNL9rMPGiXuHmvhy5G9Prar0jOa
 b3Rb+yxATh9DqWWA12knV4c+i+PXBCvvftpDvD/n11UphFJp2BeqZH9zIKPR0lStxBYJ
 rhxA==
X-Gm-Message-State: AOAM5311M/wXfAZVytbEbjSiUzkAJAAwSIga2GblfN5Bj8tv+x9l3BUV
 T8677HGLhyU316oT4rmzC4RmsYLvb+e8MNM5rdn+3rlNrd6YgmzPYBZqU7Su9Q7GUmVSSWSfY/R
 3NSjmCgB3fwpUxLpfxoch+LSFXDJsU6QxNKlBKYrIMAdu+JCdhBe2mBStx27MQB5VlGa24Q5FC/
 PX
X-Received: by 2002:a5d:64ab:0:b0:20f:ef37:a9d1 with SMTP id
 m11-20020a5d64ab000000b0020fef37a9d1mr9369033wrp.197.1654285607007; 
 Fri, 03 Jun 2022 12:46:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuvnIhOurong7vtvezP3kWkZPxDTxbauSSoQ5rlg3d2XUzp2CQf4hVdV08oPcz7h6b0HgiXQ==
X-Received: by 2002:a5d:64ab:0:b0:20f:ef37:a9d1 with SMTP id
 m11-20020a5d64ab000000b0020fef37a9d1mr9369014wrp.197.1654285606546; 
 Fri, 03 Jun 2022 12:46:46 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 l19-20020a1ced13000000b0039c1396b495sm9218184wmh.9.2022.06.03.12.46.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 12:46:45 -0700 (PDT)
Message-ID: <7a4a4117f65ae5a5cc7c8ea1882f538526fc2aaf.camel@redhat.com>
Subject: XDC 2022: Registration & Call for Presentations still open!
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 03 Jun 2022 15:46:42 -0400
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

