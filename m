Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FkQAs+5gGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:50:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9174CD9EF
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A774710E293;
	Mon,  2 Feb 2026 14:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="tYbrc7ns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 88842 seconds by postgrey-1.36 at gabe;
 Mon, 02 Feb 2026 14:50:48 UTC
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com
 [162.62.57.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED0410E4DF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1770043842;
 bh=zJJzqXmC8VOUD+LDFBd4blFT1051+zuCLIFdmL7BcI8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=tYbrc7nsb1FHG1VWGb0cNSi/Aj9c+FLvCdL7C68xbg1Y6wDwrSKblzyDk0BQjtPcW
 R+qcF9nSGcXs+Ss5gXm7WlmlwWGOBtZudo0iNRH5r815GOVXlOpksimJ0kRYg83+T0
 c0C75cHicGpF+YVFbQLToubJT79moHykLyzPUJTo=
Received: from [127.0.0.1] ([171.223.89.62])
 by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
 id C8C34863; Mon, 02 Feb 2026 22:50:12 +0800
X-QQ-mid: xmsmtpt1770043812t5pv4ovk9
Message-ID: <tencent_DFC18C734D6252A9F8D1F9BA953C0907B605@qq.com>
X-QQ-XMAILINFO: ODafEzNm5Exj+Dz65CU0HlhmQZoKdc+cGGpU92P6w5MtJNIHDWIc2+B1reM5i1
 ILuKkIUnsr9Sly/2afPZ+6QtV28K+93eivu3ujBjeH+/XqWPzRp0TKJ6zCKpXzNrd2gUgKAAAuip
 E9WH3rTMRY/E4JenjovwLOagJU5rJjovLPup6jxfGXZjwMvmbCUt98tElQDsPFqg5+BvQgEBhCJc
 Nwh2LjQecSer0sXt5ZL3ep49aCtnsQjEeqKYAS9Q3evwP+/YAg7o+l6uGYhfzGlbdyrNelpDgswM
 1aBteIJPoG+qu/b/mm5ZJGlubm0PSWct5AFTPCQMd9DAzmCFVFYQmCQjwdIZr8KO/RhZbVcbkbYz
 FKALjBr6pzsSgpWM0mxIsmv5BxGN0VCLyVcYrHesKOrW5/S8xjRxgSuYquj5B+RWLfmTMTYlcMv/
 yI8hd4ycrOj2z2KzGvzhTcfnvpwTlwArTmm5lT5eUL7YyZCtPjI7af8zsGS7+4C0QzHnL47IUf0d
 1OYGyzp/lXNP+0hEMIM2xoB0TU+KKF0kizn2a/MPnvPmDYuXS6EQnsl8gcQJDsEn9PZsTve7x0oR
 OpiH/LCZG4KS8EPEEmFA7fRCaRq8spEiHwWACTPwPpxKa4scF49hUp1Km89wwEGVOxKvkm4z3Zyk
 JoEGqDKlp8HMfzehLJmGTQLkb2UHZOGpaYTY6DOMVNGw3VAeY6EHSysXbbbSFfkshg412CRQoEUk
 oO55dl+OXNeuOUo11vMQGVKKl0wFOC0VgsBVke+VGgekR79daRfMaHKMQJidGq70IB2qYw/832ji
 gGlUPT0zvIzIzWoL4vWMUZd3zQtcraMuWpBTanq/nPAY7N4Bk8z4dRnwAF4ruXse6VwJSoNC1pdF
 yYOYXMJngFh7SrsVtlJYNecHxuZR3gHUeYENTTQFu2sKpvcLmW2EsVexJM4Ha/dVytu88BavZ2TD
 2t8/7KsfzXWJ9DghDZ31WdMT5LnLM7gN9SnpvGfgWmsRbTLgaIDf3bcTx/gpzWsMwiTR6htLjwfa
 wg826Yab34e/dW+Ppj+mwZSn7fRQGn+plut9s4byB/KeS6+v9o/haaypxblZZsAQNr7D3gBw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-OQ-MSGID: <bd386a1547697f13bd85420d8a9865d7b5455bb8.camel@foxmail.com>
Subject: Re: [PATCH] drm/vkms: Add YUV410, YUV411, YVU410, and YVU411 support
From: Renjun Wang <renjunw0@foxmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, hamohammed.sa@gmail.com, 
 simona@ffwll.ch, melissa.srw@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 02 Feb 2026 22:50:12 +0800
In-Reply-To: <ff48b706-6fdc-4350-a2de-1edc7b3f9ca7@bootlin.com>
References: <tencent_8D922FAC8459EF1AC3A4503196336AEB6006@qq.com>
 <cb2fa1da-3c5a-4398-af10-68f838f02c6d@bootlin.com>
 <ff48b706-6fdc-4350-a2de-1edc7b3f9ca7@bootlin.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,foxmail.com:email,foxmail.com:dkim,qq.com:mid,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: B9174CD9EF
X-Rspamd-Action: no action

On Mon, 2026-02-02 at 13:46 +0100, Louis Chauvet wrote:
>=20
>=20
> On 2/2/26 13:14, Louis Chauvet wrote:
> >=20
> >=20
> > On 2/1/26 15:02, Renjun Wang wrote:
> > > Add support for the following planar YUV formats:
> > > - DRM_FORMAT_YUV410
> > > - DRM_FORMAT_YUV411
> > > - DRM_FORMAT_YVU410
> > > - DRM_FORMAT_YVU411
> > >=20
> > > These formats are handled by the existing planar_yuv_read_line()
> > > function, which correctly handles the subsampling defined in each
> > > format's drm_format_info.
> > >=20
> > > The YVU variants (YVU410, YVU411) are also added to
> > > get_conversion_matrix_to_argb_u16() to ensure the U and V columns
> > > are swapped correctly in the conversion matrix.
> > >=20
> > > Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> >=20
> > This patch seems correct, so you can add my:
> >=20
> > Acked-by: Louis Chauvet <louis.chauvet@bootlin.com>
> =C2=A0>
> > But how did you test it? I don't see the support in IGT. You have
> > an=20
> > other application / use-case?
>=20
> I revert my Acked-by for this patch. It looks like the list in=20
> vkms_config.c wasn=E2=80=99t updated, which means the format won=E2=80=99=
t be usable
> by=20
> userspace.
>=20
> Could you also add support in IGT so that kms_plane can test it? From
> what I recall, this shouldn=E2=80=99t be much more complex than the VKMS=
=20
> implementation=E2=80=94just a few switches to handle the proper conversio=
ns.
>=20
> Thanks,
> Louis Chauvet
>=20
> > Thanks,
> > Louis Chauvet
> >=20
> > > ---
> > > =C2=A0 drivers/gpu/drm/vkms/vkms_formats.c | 6 ++++++
> > > =C2=A0 1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c
> > > b/drivers/gpu/drm/=20
> > > vkms/vkms_formats.c
> > > index dfb8e13cba87..5ef5d49a44ef 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > > @@ -730,9 +730,13 @@ pixel_read_line_t=20
> > > get_pixel_read_line_function(u32 format)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_P012:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_P016:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return &YUV161=
616_semiplanar_read_line;
> > > +=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YUV410:
> > > +=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YUV411:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YUV420:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YUV422:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YUV444:
> > > +=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU410:
> > > +=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU411:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU420:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU422:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU444:
> > > @@ -921,6 +925,8 @@ void get_conversion_matrix_to_argb_u16(u32
> > > format,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(matrix, matrix_to_copy, sizeof(=
*matrix_to_copy));
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (format) {
> > > +=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU410:
> > > +=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU411:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU420:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU422:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_FORMAT_YVU444:
> >=20

Hi Louis,

Sorry for missing vkms_formats[] update for YUV410, YUV411, YVU410 and
YVU411 foramts, I will fix it in version 2 patch.

I sent one igt-gpu-tool patch to=C2=A0igt-dev@lists.freedesktop.org  for
supporting YUV410, YUV411, YVU410 and YVU411 formats about one day ago.
But the patch did not appeared in the https://lore.kernel.org/igt-dev/.
I have no idea why, maybe I will check it later. With this patch, I
tested VKMS YUV410, YUV411, YVU410 and YVU411 formats supporting using
kms_plane pixel-format subtest. There is the output on my local
machine:

renjun@vm:~/code_step/igt-gpu-tools/build/tests$ sudo
IGT_FORCE_DRIVER=3Dvkms ./kms_plane --run-subtest pixel-format
IGT-Version: 2.3-ge7c61ef99 (x86_64) (Linux: 6.17.13+deb13-amd64
x86_64)
Using IGT_SRANDOM=3D1770042302 for randomisation
Opened device: /dev/dri/card1
Starting subtest: pixel-format
Using (pipe A + Virtual-2) to run the subtest.
Starting dynamic subtest: pipe-A-plane-0
...
Testing format YUV9(0x39565559) / modifier linear(0x0) (ITU-R BT.601
YCbCr, YCbCr limited range) on A.0
Testing format YUV9(0x39565559) / modifier linear(0x0) (ITU-R BT.601
YCbCr, YCbCr full range) on A.0
Testing format YUV9(0x39565559) / modifier linear(0x0) (ITU-R BT.709
YCbCr, YCbCr limited range) on A.0
Testing format YUV9(0x39565559) / modifier linear(0x0) (ITU-R BT.709
YCbCr, YCbCr full range) on A.0
Testing format YUV9(0x39565559) / modifier linear(0x0) (ITU-R BT.2020
YCbCr, YCbCr limited range) on A.0
Testing format YUV9(0x39565559) / modifier linear(0x0) (ITU-R BT.2020
YCbCr, YCbCr full range) on A.0
Testing format YU11(0x31315559) / modifier linear(0x0) (ITU-R BT.601
YCbCr, YCbCr limited range) on A.0
Testing format YU11(0x31315559) / modifier linear(0x0) (ITU-R BT.601
YCbCr, YCbCr full range) on A.0
Testing format YU11(0x31315559) / modifier linear(0x0) (ITU-R BT.709
YCbCr, YCbCr limited range) on A.0
Testing format YU11(0x31315559) / modifier linear(0x0) (ITU-R BT.709
YCbCr, YCbCr full range) on A.0
Testing format YU11(0x31315559) / modifier linear(0x0) (ITU-R BT.2020
YCbCr, YCbCr limited range) on A.0
Testing format YU11(0x31315559) / modifier linear(0x0) (ITU-R BT.2020
YCbCr, YCbCr full range) on A.0
...
Testing format YVU9(0x39555659) / modifier linear(0x0) (ITU-R BT.601
YCbCr, YCbCr limited range) on A.0
Testing format YVU9(0x39555659) / modifier linear(0x0) (ITU-R BT.601
YCbCr, YCbCr full range) on A.0
Testing format YVU9(0x39555659) / modifier linear(0x0) (ITU-R BT.709
YCbCr, YCbCr limited range) on A.0
Testing format YVU9(0x39555659) / modifier linear(0x0) (ITU-R BT.709
YCbCr, YCbCr full range) on A.0
Testing format YVU9(0x39555659) / modifier linear(0x0) (ITU-R BT.2020
YCbCr, YCbCr limited range) on A.0
Testing format YVU9(0x39555659) / modifier linear(0x0) (ITU-R BT.2020
YCbCr, YCbCr full range) on A.0
Testing format YV11(0x31315659) / modifier linear(0x0) (ITU-R BT.601
YCbCr, YCbCr limited range) on A.0
Testing format YV11(0x31315659) / modifier linear(0x0) (ITU-R BT.601
YCbCr, YCbCr full range) on A.0
Testing format YV11(0x31315659) / modifier linear(0x0) (ITU-R BT.709
YCbCr, YCbCr limited range) on A.0
Testing format YV11(0x31315659) / modifier linear(0x0) (ITU-R BT.709
YCbCr, YCbCr full range) on A.0
Testing format YV11(0x31315659) / modifier linear(0x0) (ITU-R BT.2020
YCbCr, YCbCr limited range) on A.0
Testing format YV11(0x31315659) / modifier linear(0x0) (ITU-R BT.2020
YCbCr, YCbCr full range) on A.0
...
Dynamic subtest pipe-A-plane-0: SUCCESS (53.322s)

