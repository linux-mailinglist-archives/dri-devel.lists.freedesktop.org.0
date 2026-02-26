Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPkLIppooGm+jQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 16:36:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA751A8D4B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 16:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5264A10E052;
	Thu, 26 Feb 2026 15:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF3410E052
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 15:36:52 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.233])
 by APP-03 (Coremail) with SMTP id rQCowADHq+KDaKBpWcNdCQ--.3901S2;
 Thu, 26 Feb 2026 23:36:35 +0800 (CST)
Message-ID: <893289430f07a1e89be4932bde0dd3d700366e02.camel@iscas.ac.cn>
Subject: Re: [PATCH] drm: verisilicon: DRM_VERISILICON_DC should depend on
 ARCH_THEAD
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Michal
 Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 26 Feb 2026 23:36:34 +0800
In-Reply-To: <fd65d4c53463e9579f59d7532ac6cce795d57aca.1772103393.git.geert+renesas@glider.be>
References: <fd65d4c53463e9579f59d7532ac6cce795d57aca.1772103393.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: rQCowADHq+KDaKBpWcNdCQ--.3901S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJryUtw4kKF13JFyDAw1fZwb_yoW8Cryxpa
 98KF42kFs8Jan8t39rZa4I9FWUCas3JayrGan7Jw13Zrs0yryUX39rCFy5GFyDAwsrJr42
 va10g3y7K3W7AFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k2
 0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
 8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
 IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
 AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8KsUUUUUU=
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
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:m.wilczynski@samsung.com,m:geert@glider.be,s:lists@lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FREEMAIL_TO(0.00)[glider.be,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.838];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0DA751A8D4B
X-Rspamd-Action: no action

=E5=9C=A8 2026-02-26=E5=9B=9B=E7=9A=84 12:00 +0100=EF=BC=8CGeert Uytterhoev=
en=E5=86=99=E9=81=93=EF=BC=9A
> Currently, the Verisilicon DC-series display controller driver
> supports
> only the DC8200 variant in the T-HEAD TH1520 SoC.=C2=A0 Hence restrict th=
e
> dependency on RISCV to ARCH_THEAD, to prevent asking the user about
> this
> driver when configuring a kernel without T-HEAD platform support.
>=20
> The dependency can be relaxed later, when adding support for
> appropriate
> SoCs from other vendors.

Michal Wilczynski has verified that this driver will work on StarFive
JH7110 with some extra glue drivers (but without modification to this
driver itself). [1]

Although this can be considered as future work and changing to
ARCH_THEAD seems okay now.

(BTW the hardware identification values is taken from the vendor driver
and it should support different variants of DC8200)

Thanks
Icenowy

[1]
https://lists.freedesktop.org/archives/dri-devel/2025-November/535442.html

>=20
> Fixes: dbf21777caa8b8c8 ("drm: verisilicon: add a driver for
> Verisilicon display controllers")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> =C2=A0drivers/gpu/drm/verisilicon/Kconfig | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/verisilicon/Kconfig
> b/drivers/gpu/drm/verisilicon/Kconfig
> index 7cce86ec8603c596..f2edde9e0037ebcd 100644
> --- a/drivers/gpu/drm/verisilicon/Kconfig
> +++ b/drivers/gpu/drm/verisilicon/Kconfig
> @@ -2,7 +2,7 @@
> =C2=A0config DRM_VERISILICON_DC
> =C2=A0	tristate "DRM Support for Verisilicon DC-series display
> controllers"
> =C2=A0	depends on DRM && COMMON_CLK
> -	depends on RISCV || COMPILE_TEST
> +	depends on ARCH_THEAD || COMPILE_TEST
> =C2=A0	select DRM_BRIDGE_CONNECTOR
> =C2=A0	select DRM_CLIENT_SELECTION
> =C2=A0	select DRM_DISPLAY_HELPER

