Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHTWOqxvoGk3jgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:07:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265171A9A16
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3071510E9A4;
	Thu, 26 Feb 2026 16:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9BA10E9A4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 16:07:04 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.233])
 by APP-03 (Coremail) with SMTP id rQCowACHqN+ib6BpJwheCQ--.4105S2;
 Fri, 27 Feb 2026 00:06:59 +0800 (CST)
Message-ID: <6bfa80c659d0f1336bcddd844874693766791b6e.camel@iscas.ac.cn>
Subject: Re: [PATCH 2/2] drm/dumb-buffers: document abuses in the UAPI document
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Feb 2026 00:06:58 +0800
In-Reply-To: <4380ab4e-6b40-4f72-91f3-2dc0362ce2a5@suse.de>
References: <20260226063740.2872016-1-zhengxingda@iscas.ac.cn>
 <20260226063740.2872016-2-zhengxingda@iscas.ac.cn>
 <4380ab4e-6b40-4f72-91f3-2dc0362ce2a5@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: rQCowACHqN+ib6BpJwheCQ--.4105S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KrW3tw4fJFyrurWfGw4UArb_yoW8ZF1DpF
 Z3KaykCa1kArZ3AF18Ca1avF15J397WF1rGa4jgw1xWF98tr1Iqr40kr98ZrZrZr4kGw1j
 qryavry3uasrAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k2
 0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
 8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
 IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
 AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5k9NDUUUUU==
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
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,iscas.ac.cn:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 265171A9A16
X-Rspamd-Action: no action

=E5=9C=A8 2026-02-26=E5=9B=9B=E7=9A=84 17:01 +0100=EF=BC=8CThomas Zimmerman=
n=E5=86=99=E9=81=93=EF=BC=9A
> Hi
>=20
> Am 26.02.26 um 07:37 schrieb Icenowy Zheng:
> > Although the current DRM_IOCTL_MODE_CREATE_DUMB interface design
> > only
> > suits linear buffers, some KMS drivers abuse it for AFBC
> > framebuffers.
> >=20
> > Mention it in the interface document, and clarifying that it's not
> > recommended.
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > =C2=A0 include/uapi/drm/drm_mode.h | 4 ++++
> > =C2=A0 1 file changed, 4 insertions(+)
> >=20
> > diff --git a/include/uapi/drm/drm_mode.h
> > b/include/uapi/drm/drm_mode.h
> > index cbbbfc1dfe2b8..02b6fa7ade355 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -1256,6 +1256,10 @@ struct drm_mode_crtc_page_flip_target {
>=20
> Since you're at it, you should move the line at [1] right here as the
> first sentence of this paragraph. Then continue with 'Do not
> attempt'.
>=20
> With that change, the previous paragraphs refer to pixel formats and
> the=20
> final one refers to framebuffer layout.
>=20
>=20
> > =C2=A0=C2=A0 * Do not attempt to allocate anything but linear framebuff=
er
> > memory
> > =C2=A0=C2=A0 * with single-plane RGB data. Allocation of other framebuf=
fer
> > =C2=A0=C2=A0 * layouts requires dedicated ioctls in the respective DRM
> > driver.
> > + * There exists drivers exploiting this interface for framebuffers
>=20
> 'exists user-space software'

Ah the drivers seem to be also criminal to accept this kind of usage,
it's why I thought about writing "drivers" here.

Thanks
Icenowy

>=20
> > + * with modifiers other than DRM_FORMAT_MOD_LINEAR, but this is
>=20
> Rather 'with non-linear layout'.=C2=A0 The reference to MOD_LINEAR seems
> out=20
> of place here.
>=20
> > + * incorrect usage with undefined behavior, and should not be
> > + * replicated.
>=20
> Best regards
> Thomas
>=20
> [1]=20
> https://elixir.bootlin.com/linux/v6.19/source/include/uapi/drm/drm_mode.h=
#L1216
>=20
> > =C2=A0=C2=A0 */
> > =C2=A0 struct drm_mode_create_dumb {
> > =C2=A0=C2=A0	__u32 height;

