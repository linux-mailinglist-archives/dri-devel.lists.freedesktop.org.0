Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCMNIIuunmlxWwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:10:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1DE193EFD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2D410E6E3;
	Wed, 25 Feb 2026 08:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DA710E6E3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 08:10:46 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.233])
 by APP-05 (Coremail) with SMTP id zQCowADXaQ2Arp5phP0dCQ--.9182S2;
 Wed, 25 Feb 2026 16:10:40 +0800 (CST)
Message-ID: <80590bdf692add75da321a6fc595012d10192a14.camel@iscas.ac.cn>
Subject: Re: [PATCH] drm/dumb-buffers: document that it's only for linear FB
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Feb 2026 16:10:39 +0800
In-Reply-To: <131b54f7-a611-4a02-aca8-5613643a6276@suse.de>
References: <20260225061315.1003811-1-zhengxingda@iscas.ac.cn>
 <6515820a-3bb3-4868-9b30-9c1f80709ab2@suse.de>
 <35fba9692636a2f6ba9fabc8e67f5684a54b17f1.camel@iscas.ac.cn>
 <131b54f7-a611-4a02-aca8-5613643a6276@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXaQ2Arp5phP0dCQ--.9182S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4DGr18XF13Wr4DurW5trb_yoW5WF1DpF
 W3KFW2yrs5AryfJr1jg3Z8ZFyayay7XF4fuas0y34xXr90yF1fWa18t398uF97ur1xGF12
 qrnrtFyfur1UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k2
 0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
 8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
 IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
 AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bYYLPUUUUU=
X-Originating-IP: [112.94.101.233]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
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
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[suse.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:url,iscas.ac.cn:mid,iscas.ac.cn:email]
X-Rspamd-Queue-Id: DD1DE193EFD
X-Rspamd-Action: no action

=E5=9C=A8 2026-02-25=E4=B8=89=E7=9A=84 08:47 +0100=EF=BC=8CThomas Zimmerman=
n=E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
> Am 25.02.26 um 08:38 schrieb Icenowy Zheng:
> > =E5=9C=A8 2026-02-25=E4=B8=89=E7=9A=84 08:26 +0100=EF=BC=8CThomas Zimme=
rmann=E5=86=99=E9=81=93=EF=BC=9A
> > > Hi,
> > >=20
> > > Am 25.02.26 um 07:13 schrieb Icenowy Zheng:
> > > > The ioctl interfaces for dumb buffers currently only properly
> > > > support
> > > > linear buffers.
> > > >=20
> > > > Mention this in the documentation snippet of dumb-buffers
> > > > source
> > > > code,
> > > > which is referenced by drm-kms.rst and will end up in the built
> > > > kernel
> > > > documentation.
> > > >=20
> > > > Also mention the existence of current drivers abusing dumb
> > > > buffers
> > > > for
> > > > AFBC to reduce confusion about this.
> > > >=20
> > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > ---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/drm_dumb_buffers.c | 7 ++++++-
> > > We documented the meaning of the color bits and the behavior of
> > > the
> > > dumb-buffer interface at [1]. If anything is missing, it should
> > > be
> > > added
> > > there.
> > Yes, I saw this piece of document; however it's part of the
> > interface
> > document instead of a concept document, and the whole existence of
> > the
>=20
> What is a concept document?

Well I am patching this document snippet because it becomes part of the
document at [1] (by being referenced in the .rst file).

[1] https://docs.kernel.org/gpu/drm-kms.html#dumb-buffer-objects

>=20
> > document snippet I am changing can be considered a duplicate of the
> > interface document.
> >=20
> > Thanks
> > Icenowy
> >=20
> > > Best regards
> > > Thomas
> > >=20
> > > [1]
> > > https://elixir.bootlin.com/linux/v6.19/source/include/uapi/drm/drm_mo=
de.h#L1200
> > >=20
> > > > =C2=A0=C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/drm_dumb_buffers.c
> > > > b/drivers/gpu/drm/drm_dumb_buffers.c
> > > > index e2b62e5fb891b..06f74460adf62 100644
> > > > --- a/drivers/gpu/drm/drm_dumb_buffers.c
> > > > +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> > > > @@ -57,7 +57,12 @@
> > > > =C2=A0=C2=A0=C2=A0 *
> > > > =C2=A0=C2=A0=C2=A0 * Note that dumb objects may not be used for gpu
> > > > acceleration,
> > > > as has been
> > > > =C2=A0=C2=A0=C2=A0 * attempted on some ARM embedded platforms. Such=
 drivers
> > > > really
> > > > must have
> > > > - * a hardware-specific ioctl to allocate suitable buffer
> > > > objects.
> > > > + * a hardware-specific ioctl to allocate suitable buffer
> > > > objects.
> > > > They are
> > > > + * also currently meant for only linear buffers, and using
> > > > them
> > > > with any
> > > > + * modifier other than DRM_FORMAT_MOD_LINEAR is undefined
> > > > behavior. There
> > > > + * exist some KMS drivers abusing dumb objects for AFBC
> > > > framebuffers, but this
> > > > + * behavior is discouraged, only exists as a hack now and
> > > > shouldn't be
> > > > + * replicated.
> > > > =C2=A0=C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 static int drm_mode_align_dumb(struct drm_mode_create_=
dumb
> > > > *args,

