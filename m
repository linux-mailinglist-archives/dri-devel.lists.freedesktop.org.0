Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3114F92B4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B0B10F083;
	Fri,  8 Apr 2022 10:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6814 seconds by postgrey-1.36 at gabe;
 Fri, 08 Apr 2022 10:16:16 UTC
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EEB10E148;
 Fri,  8 Apr 2022 10:16:16 +0000 (UTC)
Date: Fri, 08 Apr 2022 10:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1649412974;
 bh=CglVMq+ZKsqBthONc2WJjnguxWL+Rm4qbX6xvTyDOsE=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=Wvj9RvORFWjIucvq15xMDs9F40I50Qba/vn/6nX2DX4Xg4EGAOpPBqm853QJKNR7u
 gJb/BZ9ENOD/Jy6tZX0X/JZrofALfCGWFXlEgP7uLYrmCy5mSROyUroGqdVFupSTVf
 PcVeJ2ufeQxbB3EqH7KSjFeillGdrmXWi8/h3LWdAwk7HX/hQy2Hd+elGKG1U3KWSV
 1/pZQztIZ/pP96o5HTUvvacSr69zRuJBCHCXXdJvYMlWzYGbW/hqHzy6rnJM2ZkWLM
 EkBmr7uGSF4AL460Mnm7mhT6vq5cYDKUVB0MD3urd3HLnsiQob2M5IuneZbCNiBR2a
 R43RIxaeejyXA==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
Message-ID: <AQ3YD3wm6m_Knso5FAW-CKcokQqjDweExgrnV-f84VGkcOk8B0UcaooLiNqFMsHLOnhVnsnxC9kJMh_gY7z6rHlFaIx1OAZxSUfrOnd2jtY=@emersion.fr>
In-Reply-To: <dc3754a4-3f74-95bb-adae-56000a3756f5@redhat.com>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <acd0c8b6-b045-bab7-dc92-ea166b22c1c6@redhat.com>
 <dc3754a4-3f74-95bb-adae-56000a3756f5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Would it be an option to only support the KMS prop for Good devices,
and continue using the suboptimal existing sysfs API for Bad devices?

(I'm just throwing ideas around to see what sticks, feel free to ignore.)
