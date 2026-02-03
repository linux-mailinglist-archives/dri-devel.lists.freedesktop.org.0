Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KODLDTUDgmmYNgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 15:16:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53741DA749
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 15:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6765E10E68A;
	Tue,  3 Feb 2026 14:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="U12yxKpR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com
 [162.62.57.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA15210E68A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 14:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1770128168;
 bh=d8Qo2YjmE+pCq0beU39QEXozoGW+E5xDnedL+iNh/R4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=U12yxKpRVVzP7aTjbQU3OTUspO+SprCywUCY5N+t/jUKqNAqb0DV/A9zS4m85Ubzf
 fAqp0FFnBig7X3iD72OsSnzunlGRdLvmB9PW4FpeuvPCM/lhR5FHQxRF6SpzdUVqTU
 KAmrhWwbsuVIyqIi3GkR+jxLedo6VENkFD+Yuzt4=
Received: from [127.0.0.1] ([171.223.89.62])
 by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
 id 4058FC23; Tue, 03 Feb 2026 22:16:05 +0800
X-QQ-mid: xmsmtpt1770128165tcesu623r
Message-ID: <tencent_15AEB8D519AEB536091A96C6CC632D687205@qq.com>
X-QQ-XMAILINFO: Mna2+20dcVhjWXZBCVJkVzyEeAVn7GCzcRFsGtXX8BhTawv2y56avZOwGa6oQA
 jW6ppEAYEpU/BmbKAh/Ntf65U2RUYRyOc/pjQ/k1Z1IihIL8eI5ai3KZkCewAL6N/jP5UrgsBcuZ
 lut363PiBpZFT8VnraJ2Mx7WBjBC4hwVAilp3Gr4b2Tzeki7RBKLAifw0XuljSzbok3y6DoCFS06
 3QV9sMlQS2IUR7Vq9CJyz/6ILKZGHAB1TwKMSSJIJZez5rg6rA9joRDKwm0zmbbjDqcCM8QG/5Xq
 AayzmKy0hrorfg6B9UyDWJPZDUY/meh6xP1Ycqghq1uwpb31+UGNxecZ/LuafRVY3D6zWY1oHfoX
 cSIB7NaZsonJ/A34cWZozOWh7pFfzplcCnTKRouTqvor0XlhO/gCBZXLKN+wUnL/zqHLFgtXqUJB
 E65iCWjXdd2gO0+QqiLHiMciYhdjADUkXpl7Gridc+/Sz6ynrR6stvJDUw1c2/RGZ+8OTL8NSuiD
 KsGa9/Ut06/yx+EAVV1+v9TcccUjwiYMEakVRpOt321rKSULVITGshNtZPNJfDz1Ncf4BsoHWDKg
 uHdLBT9eKM3hLXSAIAvB3AGED+mpuPXlq/lFwxPfeYiaxWNRN8aPp9wFmTYNI0/TTLfRIYAYDZiP
 3p13GddST2xw8dOrp7neNhj1YHqaf8rtFfYgmNO+wp7xaM68ZQp/7c+utfh2sw89vkBVrK2u0chO
 lGr77dmKKm0iz0x6fJ+ffgKrrjjU3T8wtOti1uf+/GiQZfmnbNksOXrDkAzCKAtR2P0l7B4xnRFi
 MnRrbj54519i9Ukoh9nRVQ3cRvD6xxok6l8F4UEfDD4X1Cz91VhR7pjcoe37DTLihfDl+pxSGLZE
 nPnQ5fnA5CXBt1yTkEfG4UorLp2UJKWPosLFmgGqIT5vkCwLd3YsBSLEZcFzAfUXuELS7GFafvhi
 lzn47pG8yQG+olyyjGwMu7529mEpA+J5+HJ/AyfKEnPkb1py4FRvDp84Z9BKk4xapQxMmGXoI8xH
 NLrOSOiFhqz8yOOO325hfMg5VbvmR2G+jUI5NS03JzEiOi+lRQZ4bSUUwDkqwoFJH6YwtYxg==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-OQ-MSGID: <7c1fbf9108f6342efa7294253304980370fc2b2c.camel@foxmail.com>
Subject: Re: [PATCH] drm/vkms: Add YUV410, YUV411, YVU410, and YVU411 support
From: Renjun Wang <renjunw0@foxmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, hamohammed.sa@gmail.com, 
 simona@ffwll.ch, melissa.srw@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 03 Feb 2026 22:16:05 +0800
In-Reply-To: <tencent_DFC18C734D6252A9F8D1F9BA953C0907B605@qq.com>
References: <tencent_8D922FAC8459EF1AC3A4503196336AEB6006@qq.com>
 <cb2fa1da-3c5a-4398-af10-68f838f02c6d@bootlin.com>
 <ff48b706-6fdc-4350-a2de-1edc7b3f9ca7@bootlin.com>
 <tencent_DFC18C734D6252A9F8D1F9BA953C0907B605@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[foxmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[foxmail.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[bootlin.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[foxmail.com];
	FORGED_SENDER(0.00)[renjunw0@foxmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[renjunw0@foxmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[foxmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 53741DA749
X-Rspamd-Action: no action

Hi Louis,

Here is the igt-gpu-tool patch[1] i sent for VKMS YUV410/411 and
YVU410/YVU411 format test.

[1] https://patchwork.freedesktop.org/patch/702665/?series=3D161063&rev=3D1



Best Regards,

On Mon, 2026-02-02 at 22:50 +0800, Renjun Wang wrote:
> On Mon, 2026-02-02 at 13:46 +0100, Louis Chauvet wrote:
> >=20
> >=20
> > On 2/2/26 13:14, Louis Chauvet wrote:
> > >=20
> > >=20
> > > On 2/1/26 15:02, Renjun Wang wrote:
> > > > Add support for the following planar YUV formats:
> > > > - DRM_FORMAT_YUV410
> > > > - DRM_FORMAT_YUV411
> > > > - DRM_FORMAT_YVU410
> > > > - DRM_FORMAT_YVU411
> > > >=20
> > > > These formats are handled by the existing
> > > > planar_yuv_read_line()
> > > > function, which correctly handles the subsampling defined in
> > > > each
> > > > format's drm_format_info.
> > > >=20
> > > > The YVU variants (YVU410, YVU411) are also added to
> > > > get_conversion_matrix_to_argb_u16() to ensure the U and V
> > > > columns
> > > > are swapped correctly in the conversion matrix.
> > > >=20
> > > > Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> > >=20
> > > This patch seems correct, so you can add my:
> > >=20
> > > Acked-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > =C2=A0>
> > > But how did you test it? I don't see the support in IGT. You have
> > > an=20
> > > other application / use-case?
> >=20
> > I revert my Acked-by for this patch. It looks like the list in=20
> > vkms_config.c wasn=E2=80=99t updated, which means the format won=E2=80=
=99t be
> > usable
> > by=20
> > userspace.
> >=20
> > Could you also add support in IGT so that kms_plane can test it?
> > From
> > what I recall, this shouldn=E2=80=99t be much more complex than the VKM=
S=20
> > implementation=E2=80=94just a few switches to handle the proper
> > conversions.
> >=20
> > Thanks,
> > Louis Chauvet
> >=20
> > > Thanks,
> > > Louis Chauvet
> > >=20
> > > > ---
> > > > =C2=A0 drivers/gpu/drm/vkms/vkms_formats.c | 6 ++++++
> > > > =C2=A0 1 file changed, 6 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c
> > > > b/drivers/gpu/drm/=20
> > > > vkms/vkms_formats.c
> > > > index dfb8e13cba87..5ef5d49a44ef 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > > > @@ -730,9 +730,13 @@ pixel_read_line_t=20
> > > > get_pixel_read_line_function(u32 format)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_P012:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_P016:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return &YUV1=
61616_semiplanar_read_line;
> > > > +=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YUV410:
> > > > +=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YUV411:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YUV420:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YUV422:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YUV444:
> > > > +=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU410:
> > > > +=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU411:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU420:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU422:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU444:
> > > > @@ -921,6 +925,8 @@ void get_conversion_matrix_to_argb_u16(u32
> > > > format,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(matrix, matrix_to_copy, sizeo=
f(*matrix_to_copy));
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (format) {
> > > > +=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU410:
> > > > +=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU411:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU420:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU422:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU444:
> > >=20
>=20
> Hi Louis,
>=20
> Sorry for missing vkms_formats[] update for YUV410, YUV411, YVU410
> and
> YVU411 foramts, I will fix it in version 2 patch.
>=20
> I sent one igt-gpu-tool patch to=C2=A0igt-dev@lists.freedesktop.org=C2=A0=
 for
> supporting YUV410, YUV411, YVU410 and YVU411 formats about one day
> ago.
> But the patch did not appeared in the
> https://lore.kernel.org/igt-dev/.
> I have no idea why, maybe I will check it later. With this patch, I
> tested VKMS YUV410, YUV411, YVU410 and YVU411 formats supporting
> using
> kms_plane pixel-format subtest. There is the output on my local
> machine:
>=20
> renjun@vm:~/code_step/igt-gpu-tools/build/tests$ sudo
> IGT_FORCE_DRIVER=3Dvkms ./kms_plane --run-subtest pixel-format
> IGT-Version: 2.3-ge7c61ef99 (x86_64) (Linux: 6.17.13+deb13-amd64
> x86_64)
> Using IGT_SRANDOM=3D1770042302 for randomisation
> Opened device: /dev/dri/card1
> Starting subtest: pixel-format
> Using (pipe A + Virtual-2) to run the subtest.
> Starting dynamic subtest: pipe-A-plane-0
> ...
> Testing format YUV9(0x39565559) / modifier linear(0x0) (ITU-R BT.601
> YCbCr, YCbCr limited range) on A.0
> Testing format YUV9(0x39565559) / modifier linear(0x0) (ITU-R BT.601
> YCbCr, YCbCr full range) on A.0
> Testing format YUV9(0x39565559) / modifier linear(0x0) (ITU-R BT.709
> YCbCr, YCbCr limited range) on A.0
> Testing format YUV9(0x39565559) / modifier linear(0x0) (ITU-R BT.709
> YCbCr, YCbCr full range) on A.0
> Testing format YUV9(0x39565559) / modifier linear(0x0) (ITU-R BT.2020
> YCbCr, YCbCr limited range) on A.0
> Testing format YUV9(0x39565559) / modifier linear(0x0) (ITU-R BT.2020
> YCbCr, YCbCr full range) on A.0
> Testing format YU11(0x31315559) / modifier linear(0x0) (ITU-R BT.601
> YCbCr, YCbCr limited range) on A.0
> Testing format YU11(0x31315559) / modifier linear(0x0) (ITU-R BT.601
> YCbCr, YCbCr full range) on A.0
> Testing format YU11(0x31315559) / modifier linear(0x0) (ITU-R BT.709
> YCbCr, YCbCr limited range) on A.0
> Testing format YU11(0x31315559) / modifier linear(0x0) (ITU-R BT.709
> YCbCr, YCbCr full range) on A.0
> Testing format YU11(0x31315559) / modifier linear(0x0) (ITU-R BT.2020
> YCbCr, YCbCr limited range) on A.0
> Testing format YU11(0x31315559) / modifier linear(0x0) (ITU-R BT.2020
> YCbCr, YCbCr full range) on A.0
> ...
> Testing format YVU9(0x39555659) / modifier linear(0x0) (ITU-R BT.601
> YCbCr, YCbCr limited range) on A.0
> Testing format YVU9(0x39555659) / modifier linear(0x0) (ITU-R BT.601
> YCbCr, YCbCr full range) on A.0
> Testing format YVU9(0x39555659) / modifier linear(0x0) (ITU-R BT.709
> YCbCr, YCbCr limited range) on A.0
> Testing format YVU9(0x39555659) / modifier linear(0x0) (ITU-R BT.709
> YCbCr, YCbCr full range) on A.0
> Testing format YVU9(0x39555659) / modifier linear(0x0) (ITU-R BT.2020
> YCbCr, YCbCr limited range) on A.0
> Testing format YVU9(0x39555659) / modifier linear(0x0) (ITU-R BT.2020
> YCbCr, YCbCr full range) on A.0
> Testing format YV11(0x31315659) / modifier linear(0x0) (ITU-R BT.601
> YCbCr, YCbCr limited range) on A.0
> Testing format YV11(0x31315659) / modifier linear(0x0) (ITU-R BT.601
> YCbCr, YCbCr full range) on A.0
> Testing format YV11(0x31315659) / modifier linear(0x0) (ITU-R BT.709
> YCbCr, YCbCr limited range) on A.0
> Testing format YV11(0x31315659) / modifier linear(0x0) (ITU-R BT.709
> YCbCr, YCbCr full range) on A.0
> Testing format YV11(0x31315659) / modifier linear(0x0) (ITU-R BT.2020
> YCbCr, YCbCr limited range) on A.0
> Testing format YV11(0x31315659) / modifier linear(0x0) (ITU-R BT.2020
> YCbCr, YCbCr full range) on A.0
> ...
> Dynamic subtest pipe-A-plane-0: SUCCESS (53.322s)

