Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C145C93F374
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 13:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2613610E386;
	Mon, 29 Jul 2024 11:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="XZo5xC2k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B2510E386
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 11:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1722250852; x=1722855652; i=markus.elfring@web.de;
 bh=mOfcAXa8DlVInweiBdDlnESUPbxjJF0mw83cRxEatMU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XZo5xC2kjU/SjrNLsOVnEyveXgueXyyo4cUgdWklRVy7gEsFuZP5yTFWFZOt9xtf
 BZDFn4I033yIluLmj8AbpUl/s/fohn3mKZuo3AOM7tNEWUgqcd3MCcNBhYFSnG7sC
 K7nJ9q5USnAx51WvgTxG6tIwTO48FhZy7pahVCCRQaDL3hvtpF3xmE0W5CcUchurh
 jNXZ8eVq0p7jzOX2LJXhnSuNPcHbSk7ErUfLrsA0f9i/80dN3kgGGyRamB+4lEOMS
 2PiUsipZE8vwKWM7rMsZEwrFohjW41B66BAkB1OnuyS7vSRYGRtT1GoqJugThjHeH
 A80zubfW6ov6dOyJlg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MkVsg-1rr2wk3Fy2-00gcou; Mon, 29
 Jul 2024 13:00:52 +0200
Message-ID: <0b1ee6f7-b24d-49a6-ba90-d917c864ecf4@web.de>
Date: Mon, 29 Jul 2024 13:00:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Lanzano <lanzano.alex@gmail.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240729014311.1746371-3-lanzano.alex@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: Add driver for Sharp Memory LCD
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240729014311.1746371-3-lanzano.alex@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T2t2vhWyorCOuUg8hZjreHVtdE0kgmqS3TDoCqQkVYBUBgb+rie
 bMWTMVfLY5cz4YHFPvMljg4leO0HJg+BRbt6dP68Q7meGKlWlgXPjJ+/m/G7bCl3i3kCnxT
 GrNQyuDr7pMQoAhaFwMR0WYrLBCbOdmoFg6vv/pjkWmrWb/UHFxBjigKlZw5/OMO5HpjqMz
 4pcE8QHobSPkRJyntCkcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HHAO4c8thIA=;/k4QbPk8lbVfZQptrBg8r44ndmH
 /vEEG3b3qlWT8JYi+4BZqp8tDZh/6tZrwR8hZ6cn5rNBAO7EN38dOIl34HajYgKxhwyCQhHC3
 VZrSMwE6X3aDuuiMNilgteCLvV03MyGsgsbc/9rnKdMS8wrd4sC2X1MrjPCRByoY5rXSi+3v+
 AIt0r/mOBvAinF0b/5C7W8z+W8NcqgBACLj9RbvMsG/U+LXjQWox7D2aBmzH1CJtWYiAxkt8J
 9tnVvxViJFsf/N6AFgM5tsKZ5bMZz5iZ6dVEsnr7hRqk+BOThcz2Vbq8ozaYDUOql8h3uNsmr
 uN9QbGhtJl/Zr1WN4XovbxNMJ/vKsooRM1koo9XHuSkS98odADsUBIIWUcRJF1tFSlqrj45ai
 u476lKfZGh7Jw1ViG51K40wCxTJOJuC1dcHIdnhO78SneHbiQmneBWcRw3vFGUjepla7VOYM9
 DtkS7yyS+K025XEIbGhbuc+1RJfaaXiCJtnc1ursQi8smLMqJ6ASAykGoGpRAVpJnNSHOZrpt
 M6cfTNbvB+sbLSQ67kAByvmQBovIAGwBHYobdPjGGie4Jhmq44DgyZHwr4EBszpSacNtG240F
 pbxCoyHvixZGozelXiVwcW5iwfS+bDJE/WNlbZVB8nHcepTRIwcd/HkAvtKZjW1ftHcYtL+9n
 wkYrTLb+Ssh0F88Gs4p9HrX8xAGeXg6dUBbItM0xjvx962w5Y9x9/taW9ljYKvtk+OBYpQF2F
 DPCzoFVcl/ETRd1gM4/6Te0h+waw33lR1qx+DerVrcI7FmxsFJijWUAi4MRt4oHMBKxIobX7g
 HK8xzmmxzQPMom7XPG+QZXcw==
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

=E2=80=A6
> +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> @@ -0,0 +1,684 @@
=E2=80=A6
> static int sharp_memory_update_display(struct sharp_memory_device *smd,
> +				       struct drm_framebuffer *fb,
> +				       struct drm_rect clip,
> +				       struct drm_format_conv_state *fmtcnv_state)
> +{
=E2=80=A6
> +	mutex_lock(&smd->tx_mutex);
> +
> +	/* Populate the transmit buffer with frame data */
=E2=80=A6
> +	mutex_unlock(&smd->tx_mutex);
> +
> +	return ret;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&smd->tx_mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10.2/source/include/linux/mutex.h#L196

Regards,
Markus
