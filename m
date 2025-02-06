Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED9A2A770
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 12:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89E710E81C;
	Thu,  6 Feb 2025 11:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0oYRr92n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gSAGiid5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0oYRr92n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gSAGiid5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6125B10E81C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 11:24:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B759D21151;
 Thu,  6 Feb 2025 11:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738841097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LxlBqgQZ2mGevUkwUY0XWfJI/prk0cOqvknMgsqxTz4=;
 b=0oYRr92nFBfP0dTM7ews1LOJHGWwtKo5+xwFPHIwc+MNtmz/WltWJ7gapF6mz1aWXdVRoC
 WnG0d7xp/OgrI2dfhT7BH1e2ZpTTOpxt/xHA4e4NaKrm19AvUX4jYZwMq/xVksjTtdpEFv
 w2rXsGxC/SkoXAfFQDeMYhGlmDqMwHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738841097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LxlBqgQZ2mGevUkwUY0XWfJI/prk0cOqvknMgsqxTz4=;
 b=gSAGiid53eeJMYtQ1Ut/LjpaL9yThUumW2XTl8VgKKCMlmhZcIZ8C81cCIbRRUxLG1aMah
 aWvvywoEaYPrEhBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0oYRr92n;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gSAGiid5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738841097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LxlBqgQZ2mGevUkwUY0XWfJI/prk0cOqvknMgsqxTz4=;
 b=0oYRr92nFBfP0dTM7ews1LOJHGWwtKo5+xwFPHIwc+MNtmz/WltWJ7gapF6mz1aWXdVRoC
 WnG0d7xp/OgrI2dfhT7BH1e2ZpTTOpxt/xHA4e4NaKrm19AvUX4jYZwMq/xVksjTtdpEFv
 w2rXsGxC/SkoXAfFQDeMYhGlmDqMwHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738841097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LxlBqgQZ2mGevUkwUY0XWfJI/prk0cOqvknMgsqxTz4=;
 b=gSAGiid53eeJMYtQ1Ut/LjpaL9yThUumW2XTl8VgKKCMlmhZcIZ8C81cCIbRRUxLG1aMah
 aWvvywoEaYPrEhBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71D1813694;
 Thu,  6 Feb 2025 11:24:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mfdxGgmcpGe3aQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 11:24:57 +0000
Message-ID: <c2308a59-ab8f-407a-bdd9-5c7824bb9d13@suse.de>
Date: Thu, 6 Feb 2025 12:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Added support for the new device G200eH5
To: Gwenael Georgeault <ggeorgea@matrox.com>, Dave Airlie
 <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <alpine.LFD.2.00.2502051724170.31360@pluton.matrox.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <alpine.LFD.2.00.2502051724170.31360@pluton.matrox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B759D21151
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[matrox.com,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO
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

Hi,

I want to second what Jocelyn said.


Am 05.02.25 um 23:28 schrieb Gwenael Georgeault:
> - Added the new device ID
> - Added new pll algorithm
>
> Co-authored-by: Mamadou Insa Diop <mdiop@matrox.com>
> ---
>  drivers/gpu/drm/mgag200/Makefile          |   1 +
>  drivers/gpu/drm/mgag200/mgag200_drv.c     |   4 +
>  drivers/gpu/drm/mgag200/mgag200_drv.h     |   3 +
>  drivers/gpu/drm/mgag200/mgag200_g200eh5.c | 202 ++++++++++++++++++++++
>  4 files changed, 210 insertions(+)
>  create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh5.c
>
> diff --git a/drivers/gpu/drm/mgag200/Makefile 
> b/drivers/gpu/drm/mgag200/Makefile
> index 5a02203fad12..94f063c8722a 100644
> --- a/drivers/gpu/drm/mgag200/Makefile
> +++ b/drivers/gpu/drm/mgag200/Makefile
> @@ -6,6 +6,7 @@ mgag200-y := \
>      mgag200_g200.o \
>      mgag200_g200eh.o \
>      mgag200_g200eh3.o \
> +    mgag200_g200eh5.o \
>      mgag200_g200er.o \
>      mgag200_g200ev.o \
>      mgag200_g200ew3.o \
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c 
> b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 069fdd2dc8f6..1c257f5b5136 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -214,6 +214,7 @@ static const struct pci_device_id 
> mgag200_pciidlist[] = {
>      { PCI_VENDOR_ID_MATROX, 0x534, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_ER },
>      { PCI_VENDOR_ID_MATROX, 0x536, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_EW3 },
>      { PCI_VENDOR_ID_MATROX, 0x538, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_EH3 },
> +    { PCI_VENDOR_ID_MATROX, 0x53A, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_EH5 },

It's a personal preference, but I tend to use lower case hex values, 
0x53a  would be preferable here. There might be other instances in the 
patch.

Apart from this and what Jocelyn noted, the patch looks good.

Best regards
Thomas

> {0,}
>  };
>
> @@ -256,6 +257,9 @@ mgag200_pci_probe(struct pci_dev *pdev, const 
> struct pci_device_id *ent)
>      case G200_EH3:
>          mdev = mgag200_g200eh3_device_create(pdev, &mgag200_driver);
>          break;
> +    case G200_EH5:
> +        mdev = mgag200_g200eh5_device_create(pdev, &mgag200_driver);
> +        break;
>      case G200_ER:
>          mdev = mgag200_g200er_device_create(pdev, &mgag200_driver);
>          break;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h 
> b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 0608fc63e588..819a7e9381e3 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -196,6 +196,7 @@ enum mga_type {
>      G200_EV,
>      G200_EH,
>      G200_EH3,
> +    G200_EH5,
>      G200_ER,
>      G200_EW3,
>  };
> @@ -334,6 +335,8 @@ struct mga_device 
> *mgag200_g200eh_device_create(struct pci_dev *pdev,
>                          const struct drm_driver *drv);
>  struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
>                           const struct drm_driver *drv);
> +struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
> +                         const struct drm_driver *drv);
>  struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev,
>                          const struct drm_driver *drv);
>  struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh5.c 
> b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
> new file mode 100644
> index 000000000000..8cb01116ac33
> --- /dev/null
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/pci.h>
> +#include <linux/units.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "mgag200_drv.h"
> +
> +/*
> + * PIXPLLC
> + */
> +
> +static int mgag200_g200eh5_pixpllc_atomic_check(struct drm_crtc *crtc,
> +                        struct drm_atomic_state *new_state)
> +{
> +    const unsigned long long VCO_MAX = 10 * GIGA; // Hz
> +    const unsigned long long VCO_MIN = 2500 * MEGA; // Hz
> +    const unsigned long long PLL_FREQ_REF = 25 * MEGA; // Hz
> +
> +    struct drm_crtc_state *new_crtc_state = 
> drm_atomic_get_new_crtc_state(new_state, crtc);
> +    struct mgag200_crtc_state *new_mgag200_crtc_state = 
> to_mgag200_crtc_state(new_crtc_state);
> +    long clock = new_crtc_state->mode.clock;
> +    struct mgag200_pll_values *pixpllc = 
> &new_mgag200_crtc_state->pixpllc;
> +
> +    unsigned long long fdelta = 0xFFFFFFFFFFFFFFFFULL;
> +
> +    u16 mult_max = (u16)(VCO_MAX / PLL_FREQ_REF); // 400 (0x190)
> +    u16 mult_min = (u16)(VCO_MIN / PLL_FREQ_REF); // 100 (0x64)
> +
> +    u64 ftmp_delta;
> +    u64 computed_fo;
> +
> +    u16 test_m;
> +    u8 test_div_a;
> +    u8 test_div_b;
> +    u64 fo_hz;
> +
> +    u8 uc_m = 0;
> +    u8 uc_n = 0;
> +    u8 uc_p = 0;
> +
> +    fo_hz = (u64)clock * HZ_PER_KHZ;
> +
> +    for (test_m = mult_min; test_m <= mult_max; test_m++) { // This 
> gives 100 <= M <= 400
> +        for (test_div_a = 8; test_div_a > 0; test_div_a--) { // This 
> gives 1 <= A <= 8
> +            for (test_div_b = 1; test_div_b <= test_div_a; 
> test_div_b++) {
> +                // This gives 1 <= B <= A
> +                computed_fo = (PLL_FREQ_REF * test_m) /
> +                    (4 * test_div_a * test_div_b);
> +
> +                if (computed_fo > fo_hz)
> +                    ftmp_delta = computed_fo - fo_hz;
> +                else
> +                    ftmp_delta = fo_hz - computed_fo;
> +
> +                if (ftmp_delta < fdelta) {
> +                    fdelta = ftmp_delta;
> +                    uc_m = (u8)(0xFF & test_m);
> +                    uc_n = (u8)((0x7 & (test_div_a - 1))
> +                        | (0x70 & (0x7 & (test_div_b - 1)) << 4));
> +                    uc_p = (u8)(1 & (test_m >> 8));
> +                }
> +                if (fdelta == 0)
> +                    break;
> +            }
> +            if (fdelta == 0)
> +                break;
> +        }
> +        if (fdelta == 0)
> +            break;
> +    }
> +
> +    pixpllc->m = uc_m + 1;
> +    pixpllc->n = uc_n + 1;
> +    pixpllc->p = uc_p + 1;
> +    pixpllc->s = 0;
> +
> +    return 0;
> +    }
> +
> +/*
> + * Mode-setting pipeline
> + */
> +
> +static const struct drm_plane_helper_funcs 
> mgag200_g200eh5_primary_plane_helper_funcs = {
> +    MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
> +};
> +
> +static const struct drm_plane_funcs 
> mgag200_g200eh5_primary_plane_funcs = {
> +    MGAG200_PRIMARY_PLANE_FUNCS,
> +};
> +
> +static const struct drm_crtc_helper_funcs 
> mgag200_g200eh5_crtc_helper_funcs = {
> +    MGAG200_CRTC_HELPER_FUNCS,
> +};
> +
> +static const struct drm_crtc_funcs mgag200_g200eh5_crtc_funcs = {
> +    MGAG200_CRTC_FUNCS,
> +};
> +
> +static int mgag200_g200eh5_pipeline_init(struct mga_device *mdev)
> +{
> +    struct drm_device *dev = &mdev->base;
> +    struct drm_plane *primary_plane = &mdev->primary_plane;
> +    struct drm_crtc *crtc = &mdev->crtc;
> +    int ret;
> +
> +    ret = drm_universal_plane_init(dev, primary_plane, 0,
> +                       &mgag200_g200eh5_primary_plane_funcs,
> +                       mgag200_primary_plane_formats,
> +                       mgag200_primary_plane_formats_size,
> +                       mgag200_primary_plane_fmtmods,
> +                       DRM_PLANE_TYPE_PRIMARY, NULL);
> +    if (ret) {
> +        drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
> +        return ret;
> +    }
> +    drm_plane_helper_add(primary_plane, 
> &mgag200_g200eh5_primary_plane_helper_funcs);
> +    drm_plane_enable_fb_damage_clips(primary_plane);
> +
> +    ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
> +                    &mgag200_g200eh5_crtc_funcs, NULL);
> +    if (ret) {
> +        drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
> +        return ret;
> +    }
> +
> +    drm_crtc_helper_add(crtc, &mgag200_g200eh5_crtc_helper_funcs);
> +
> +    /* FIXME: legacy gamma tables, but atomic gamma doesn't work 
> without */
> +    drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
> +    drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
> +    ret = mgag200_vga_bmc_output_init(mdev);
> +
> +    if (ret)
> +        return ret;
> +
> +    return 0;
> +}
> +
> +/*
> + * DRM device
> + */
> +
> +static const struct mgag200_device_info mgag200_g200eh5_device_info =
> +    MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, 1, 0, false);
> +
> +static const struct mgag200_device_funcs mgag200_g200eh5_device_funcs 
> = {
> +    .pixpllc_atomic_check = mgag200_g200eh5_pixpllc_atomic_check,
> +    .pixpllc_atomic_update = mgag200_g200eh_pixpllc_atomic_update, // 
> same as G200EH
> +};
> +
> +struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
> +                         const struct drm_driver *drv)
> +{
> +    struct mga_device *mdev;
> +    struct drm_device *dev;
> +    resource_size_t vram_available;
> +    int ret;
> +
> +    mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
> +
> +    if (IS_ERR(mdev))
> +        return mdev;
> +    dev = &mdev->base;
> +
> +    pci_set_drvdata(pdev, dev);
> +
> +    ret = mgag200_init_pci_options(pdev, 0x00000120, 0x0000b000);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    ret = mgag200_device_preinit(mdev);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    ret = mgag200_device_init(mdev, &mgag200_g200eh5_device_info,
> +                  &mgag200_g200eh5_device_funcs);
> +
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    mgag200_g200eh_init_registers(mdev); // same as G200EH
> +    vram_available = mgag200_device_probe_vram(mdev);
> +
> +    ret = mgag200_mode_config_init(mdev, vram_available);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    ret = mgag200_g200eh5_pipeline_init(mdev);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    drm_mode_config_reset(dev);
> +    drm_kms_helper_poll_init(dev);
> +
> +    return mdev;
> +}

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

