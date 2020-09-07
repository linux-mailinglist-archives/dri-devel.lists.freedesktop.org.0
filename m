Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F6D25F496
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF3E6E2F9;
	Mon,  7 Sep 2020 08:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7236E2F9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:09:33 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j2so14763508wrx.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vISUpoBN1kH4usxTG/CMAMfOFxyeKd1cKFFqqtgy4bk=;
 b=lJcGOUcOHcK+PvwscgOv8mOjWubWf7aPCn0R/nFJ3UdfU5otHdGYsr4fh96L2epaP3
 oJPhmAqZEMpDEorQcMgSWWUEi3ep6NK8/u8nauxq/JJmkqB8fbMeVfyDajkzli8GnaXK
 i2THOayjoaoeREPD7jK0JXwn4Td6qHMQKsxo4idqbZ2MRlFXdPZaGGWRFqWtj+zlg28o
 O3FD5XFp7CG+X1vU39q6HOUgnnlRrauSJbc6/Edm+uDCPMTro6CqSKOGXpETqf8jmogH
 yeQfQbHK30lPsShylfmL9Vj6BlVcLqT8NG4dl5Kxmc50pjZM3RgpO7eX3LvVgiVcCtD7
 fQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vISUpoBN1kH4usxTG/CMAMfOFxyeKd1cKFFqqtgy4bk=;
 b=ltBJ+ygdG+jGnEtgvP6bICifZRY5cxq0D/Q2QKDRw22/yhiyYEriG+6U/a7U78n1th
 I4tiUHYussFVdPbxFFiZZT42ulKUswCaWMy3rHmnRrxRZAfbFm/23Fo8TApwcX/smvTl
 KmtPZvGGL8rph3mxVTjEOuHlpJPZhSDMhmdV9YWAIk1mHgVdnVncVdaIWujBtk+sLPf2
 uHfID7/3bnSgX1w14n2/UzrFqMYnA74MhjSA5VAWuUSsZzwEc24KXb0eb6nCZDUZPZ7j
 ixYId0pbmOw8iZfFItIelKHSNarREDaQLR8HpM8OSdwVli/TNputOGGj02EQje1GZ3GP
 3XuA==
X-Gm-Message-State: AOAM533P0n7aNb6tC1fJ0Oo39JsD0RLsB/VRDDZM2TLpYTqHqAwa0rtZ
 WkvWgey2mZipWga0VsAjEQjAylRovXGtKZL+
X-Google-Smtp-Source: ABdhPJwFAZdjB34nPwosr9u5j8SAPdQKnOwIeeN9TWxKUejFCFHDRsCd0X6ECXt09AWpkZe/BUFPkw==
X-Received: by 2002:adf:e6c2:: with SMTP id y2mr21872961wrm.117.1599466171895; 
 Mon, 07 Sep 2020 01:09:31 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac?
 ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id i1sm31339865wrc.49.2020.09.07.01.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 01:09:31 -0700 (PDT)
Subject: Re: [PATCH v2] drm/bridge: dw-mipi-dsi.c: Add VPG runtime config
 through debugfs
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>, yannick.fertre@st.com,
 philippe.cornu@st.com, benjamin.gaignard@st.com, airlied@linux.ie,
 daniel@ffwll.ch, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 pop.adrian61@gmail.com
References: <a809feb7d7153a92e323416f744f1565e995da01.1586180592.git.angelo.ribeiro@synopsys.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwU0EVid/pAEQAND7AFhr
 5faf/EhDP9FSgYd/zgmb7JOpFPje3uw7jz9wFb28Cf0Y3CcncdElYoBNbRlesKvjQRL8mozV
 9RN+IUMHdUx1akR/A4BPXNdL7StfzKWOCxZHVS+rIQ/fE3Qz/jRmT6t2ZkpplLxVBpdu95qJ
 YwSZjuwFXdC+A7MHtQXYi3UfCgKiflj4+/ITcKC6EF32KrmIRqamQwiRsDcUUKlAUjkCLcHL
 CQvNsDdm2cxdHxC32AVm3Je8VCsH7/qEPMQ+cEZk47HOR3+Ihfn1LEG5LfwsyWE8/JxsU2a1
 q44LQM2lcK/0AKAL20XDd7ERH/FCBKkNVzi+svYJpyvCZCnWT0TRb72mT+XxLWNwfHTeGALE
 +1As4jIS72IglvbtONxc2OIid3tR5rX3k2V0iud0P7Hnz/JTdfvSpVj55ZurOl2XAXUpGbq5
 XRk5CESFuLQV8oqCxgWAEgFyEapI4GwJsvfl/2Er8kLoucYO1Id4mz6N33+omPhaoXfHyLSy
 dxD+CzNJqN2GdavGtobdvv/2V0wukqj86iKF8toLG2/Fia3DxMaGUxqI7GMOuiGZjXPt/et/
 qeOySghdQ7Sdpu6fWc8CJXV2mOV6DrSzc6ZVB4SmvdoruBHWWOR6YnMz01ShFE49pPucyU1h
 Av4jC62El3pdCrDOnWNFMYbbon3vABEBAAHCwn4EGAECAAkFAlYnf6QCGwICKQkQFpq3saTP
 +K7BXSAEGQECAAYFAlYnf6QACgkQd9zb2sjISdGToxAAkOjSfGxp0ulgHboUAtmxaU3viucV
 e2Hl1BVDtKSKmbIVZmEUvx9D06IijFaEzqtKD34LXD6fjl4HIyDZvwfeaZCbJbO10j3k7FJE
 QrBtpdVqkJxme/nYlGOVzcOiKIepNkwvnHVnuVDVPcXyj2wqtsU7VZDDX41z3X4xTQwY3SO1
 9nRO+f+i4RmtJcITgregMa2PcB0LvrjJlWroI+KAKCzoTHzSTpCXMJ1U/dEqyc87bFBdc+DI
 k8mWkPxsccdbs4t+hH0NoE3Kal9xtAl56RCtO/KgBLAQ5M8oToJVatxAjO1SnRYVN1EaAwrR
 xkHdd97qw6nbg9BMcAoa2NMc0/9MeiaQfbgW6b0reIz/haHhXZ6oYSCl15Knkr4t1o3I2Bqr
 Mw623gdiTzotgtId8VfLB2Vsatj35OqIn5lVbi2ua6I0gkI6S7xJhqeyrfhDNgzTHdQVHB9/
 7jnM0ERXNy1Ket6aDWZWCvM59dTyu37g3VvYzGis8XzrX1oLBU/tTXqo1IFqqIAmvh7lI0Se
 gCrXz7UanxCwUbQBFjzGn6pooEHJYRLuVGLdBuoApl/I4dLqCZij2AGa4CFzrn9W0cwm3HCO
 lR43gFyz0dSkMwNUd195FrvfAz7Bjmmi19DnORKnQmlvGe/9xEEfr5zjey1N9+mt3//geDP6
 clwKBkq0JggA+RTEAELzkgPYKJ3NutoStUAKZGiLOFMpHY6KpItbbHjF2ZKIU1whaRYkHpB2
 uLQXOzZ0d7x60PUdhqG3VmFnzXSztA4vsnDKk7x2xw0pMSTKhMafpxaPQJf494/jGnwBHyi3
 h3QGG1RjfhQ/OMTX/HKtAUB2ct3Q8/jBfF0hS5GzT6dYtj0Ci7+8LUsB2VoayhNXMnaBfh+Q
 pAhaFfRZWTjUFIV4MpDdFDame7PB50s73gF/pfQbjw5Wxtes/0FnqydfId95s+eej+17ldGp
 lMv1ok7K0H/WJSdr7UwDAHEYU++p4RRTJP6DHWXcByVlpNQ4SSAiivmWiwOt490+Ac7ATQRN
 WQbPAQgAvIoM384ZRFocFXPCOBir5m2J+96R2tI2XxMgMfyDXGJwFilBNs+fpttJlt2995A8
 0JwPj8SFdm6FBcxygmxBBCc7i/BVQuY8aC0Z/w9Vzt3Eo561r6pSHr5JGHe8hwBQUcNPd/9l
 2ynP57YTSE9XaGJK8gIuTXWo7pzIkTXfN40Wh5jeCCspj4jNsWiYhljjIbrEj300g8RUT2U0
 FcEoiV7AjJWWQ5pi8lZJX6nmB0lc69Jw03V6mblgeZ/1oTZmOepkagwy2zLDXxihf0GowUif
 GphBDeP8elWBNK+ajl5rmpAMNRoKxpN/xR4NzBg62AjyIvigdywa1RehSTfccQARAQABwsBf
 BBgBAgAJBQJNWQbPAhsMAAoJEBaat7Gkz/iuteIH+wZuRDqK0ysAh+czshtG6JJlLW6eXJJR
 Vi7dIPpgFic2LcbkSlvB8E25Pcfz/+tW+04Urg4PxxFiTFdFCZO+prfd4Mge7/OvUcwoSub7
 ZIPo8726ZF5/xXzajahoIu9/hZ4iywWPAHRvprXaim5E/vKjcTeBMJIqZtS4u/UK3EpAX59R
 XVxVpM8zJPbk535ELUr6I5HQXnihQm8l6rt9TNuf8p2WEDxc8bPAZHLjNyw9a/CdeB97m2Tr
 zR8QplXA5kogS4kLe/7/JmlDMO8Zgm9vKLHSUeesLOrjdZ59EcjldNNBszRZQgEhwaarfz46
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <5ecbb66f-1f65-d4c4-3593-49c537378efe@baylibre.com>
Date: Mon, 7 Sep 2020 10:09:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a809feb7d7153a92e323416f744f1565e995da01.1586180592.git.angelo.ribeiro@synopsys.com>
Content-Language: en-US
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 06/04/2020 15:49, Angelo Ribeiro wrote:
> Add support for the video pattern generator (VPG) BER pattern mode and
> configuration in runtime.
> 
> This enables using the debugfs interface to manipulate the VPG after
> the pipeline is set.
> Also, enables the usage of the VPG BER pattern.
> 
> Changes in v2:
>   - Added VID_MODE_VPG_MODE
>   - Solved incompatible return type on __get and __set
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Adrian Pop <pop.adrian61@gmail.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Cc: Jose Abreu <jose.abreu@synopsys.com>
> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 98 ++++++++++++++++++++++++---
>  1 file changed, 90 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index b18351b..9de3645 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -91,6 +91,7 @@
>  #define VID_MODE_TYPE_BURST			0x2
>  #define VID_MODE_TYPE_MASK			0x3
>  #define VID_MODE_VPG_ENABLE		BIT(16)
> +#define VID_MODE_VPG_MODE		BIT(20)
>  #define VID_MODE_VPG_HORIZONTAL		BIT(24)
>  
>  #define DSI_VID_PKT_SIZE		0x3c
> @@ -221,6 +222,21 @@
>  #define PHY_STATUS_TIMEOUT_US		10000
>  #define CMD_PKT_STATUS_TIMEOUT_US	20000
>  
> +#ifdef CONFIG_DEBUG_FS
> +#define VPG_DEFS(name, dsi) \
> +	((void __force *)&((*dsi).vpg_defs.name))
> +
> +#define REGISTER(name, mask, dsi) \
> +	{ #name, VPG_DEFS(name, dsi), mask, dsi }
> +
> +struct debugfs_entries {
> +	const char				*name;
> +	bool					*reg;
> +	u32					mask;
> +	struct dw_mipi_dsi			*dsi;
> +};
> +#endif /* CONFIG_DEBUG_FS */
> +
>  struct dw_mipi_dsi {
>  	struct drm_bridge bridge;
>  	struct mipi_dsi_host dsi_host;
> @@ -238,9 +254,12 @@ struct dw_mipi_dsi {
>  
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *debugfs;
> -
> -	bool vpg;
> -	bool vpg_horizontal;
> +	struct debugfs_entries *debugfs_vpg;
> +	struct {
> +		bool vpg;
> +		bool vpg_horizontal;
> +		bool vpg_ber_pattern;
> +	} vpg_defs;
>  #endif /* CONFIG_DEBUG_FS */
>  
>  	struct dw_mipi_dsi *master; /* dual-dsi master ptr */
> @@ -530,9 +549,11 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
>  		val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
>  
>  #ifdef CONFIG_DEBUG_FS
> -	if (dsi->vpg) {
> +	if (dsi->vpg_defs.vpg) {
>  		val |= VID_MODE_VPG_ENABLE;
> -		val |= dsi->vpg_horizontal ? VID_MODE_VPG_HORIZONTAL : 0;
> +		val |= dsi->vpg_defs.vpg_horizontal ?
> +		       VID_MODE_VPG_HORIZONTAL : 0;
> +		val |= dsi->vpg_defs.vpg_ber_pattern ? VID_MODE_VPG_MODE : 0;
>  	}
>  #endif /* CONFIG_DEBUG_FS */
>  
> @@ -961,6 +982,68 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
>  
>  #ifdef CONFIG_DEBUG_FS
>  
> +int dw_mipi_dsi_debugfs_write(void *data, u64 val)
> +{
> +	struct debugfs_entries *vpg = data;
> +	struct dw_mipi_dsi *dsi;
> +	u32 mode_cfg;
> +
> +	if (!vpg)
> +		return -ENODEV;
> +
> +	dsi = vpg->dsi;
> +
> +	*vpg->reg = (bool)val;
> +
> +	mode_cfg = dsi_read(dsi, DSI_VID_MODE_CFG);
> +
> +	if (*vpg->reg)
> +		mode_cfg |= vpg->mask;
> +	else
> +		mode_cfg &= ~vpg->mask;
> +
> +	dsi_write(dsi, DSI_VID_MODE_CFG, mode_cfg);
> +
> +	return 0;
> +}
> +
> +int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
> +{
> +	struct debugfs_entries *vpg = data;
> +
> +	if (!vpg)
> +		return -ENODEV;
> +
> +	*val = *vpg->reg;
> +
> +	return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_x32, dw_mipi_dsi_debugfs_show,
> +			 dw_mipi_dsi_debugfs_write, "%llu\n");
> +
> +static void debugfs_create_files(void *data)
> +{
> +	struct dw_mipi_dsi *dsi = data;
> +	struct debugfs_entries debugfs[] = {
> +		REGISTER(vpg, VID_MODE_VPG_ENABLE, dsi),
> +		REGISTER(vpg_horizontal, VID_MODE_VPG_HORIZONTAL, dsi),
> +		REGISTER(vpg_ber_pattern, VID_MODE_VPG_MODE, dsi),
> +	};
> +	int i;
> +
> +	dsi->debugfs_vpg = kmalloc(sizeof(debugfs), GFP_KERNEL);
> +	if (!dsi->debugfs_vpg)
> +		return;
> +
> +	memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
> +
> +	for (i = 0; i < ARRAY_SIZE(debugfs); i++)
> +		debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
> +				    dsi->debugfs, &dsi->debugfs_vpg[i],
> +				    &fops_x32);
> +}
> +
>  static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
>  {
>  	dsi->debugfs = debugfs_create_dir(dev_name(dsi->dev), NULL);
> @@ -969,14 +1052,13 @@ static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
>  		return;
>  	}
>  
> -	debugfs_create_bool("vpg", 0660, dsi->debugfs, &dsi->vpg);
> -	debugfs_create_bool("vpg_horizontal", 0660, dsi->debugfs,
> -			    &dsi->vpg_horizontal);
> +	debugfs_create_files(dsi);
>  }
>  
>  static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi)
>  {
>  	debugfs_remove_recursive(dsi->debugfs);
> +	kfree(dsi->debugfs_vpg);
>  }
>  
>  #else
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applying to drm-misc-next

Thanks,
Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
