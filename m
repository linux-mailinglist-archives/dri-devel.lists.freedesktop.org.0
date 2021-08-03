Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 455AB3DE90F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 10:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D52189FAC;
	Tue,  3 Aug 2021 08:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E774E89FAC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 08:58:19 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 743F021E41;
 Tue,  3 Aug 2021 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627981098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eQhTY10u3x+IAuEHCDabmNDZe06nM+q5fU3VI6dmgD4=;
 b=XS2oOLiPkFT91Jpo8pXJaxShb79AvwLNEiVP7wOyJtgbxOkhPJDA9rdb+C40Nki/hpNwQ7
 B+rJgqKNUYB5vD6Hzu/q4GEXNM9XeOwWFEHpz/5/Dfsb84oJvUIzyOMj+ySTbAP4JSvdns
 bcZHFf7cP4tUxWT/m9ip97DsNI6bnjM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627981098;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eQhTY10u3x+IAuEHCDabmNDZe06nM+q5fU3VI6dmgD4=;
 b=b9VcRFFOntLtSFmhEqTrquir5dZ8dbxrScxbZK+0R+wj32ll31FhuT2EF3JT939Jq1saBh
 7Zl8B5fb8jqfO+Ag==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4069913709;
 Tue,  3 Aug 2021 08:58:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id AV0vDioFCWGYegAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 08:58:18 +0000
Subject: Re: [PATCH v5] drm/ast: Fixed CVE for DP501
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>, Arc Sung
 <arc_sung@aspeedtech.com>, "airlied@redhat.com" <airlied@redhat.com>
References: <214f1451-2406-b298-e233-4939cae9e1f2@suse.de>
 <20210421085859.17761-1-kuohsiang_chou@aspeedtech.com>
 <2662b502-edbe-b79b-b458-dbabafe6ca3c@suse.de>
 <HK2PR06MB3300831DB8F41525C92B28708C5F9@HK2PR06MB3300.apcprd06.prod.outlook.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a31502d1-b1ea-d74d-a5c7-b4200e52ff4d@suse.de>
Date: Tue, 3 Aug 2021 10:58:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <HK2PR06MB3300831DB8F41525C92B28708C5F9@HK2PR06MB3300.apcprd06.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WbwMXHLLLun9aM9P6NsNCyNHCoblkJXIZ"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WbwMXHLLLun9aM9P6NsNCyNHCoblkJXIZ
Content-Type: multipart/mixed; boundary="utssQvEIn1JhAZ273DIaTgvjFviyP1avd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>, Arc Sung
 <arc_sung@aspeedtech.com>, "airlied@redhat.com" <airlied@redhat.com>
Message-ID: <a31502d1-b1ea-d74d-a5c7-b4200e52ff4d@suse.de>
Subject: Re: [PATCH v5] drm/ast: Fixed CVE for DP501
References: <214f1451-2406-b298-e233-4939cae9e1f2@suse.de>
 <20210421085859.17761-1-kuohsiang_chou@aspeedtech.com>
 <2662b502-edbe-b79b-b458-dbabafe6ca3c@suse.de>
 <HK2PR06MB3300831DB8F41525C92B28708C5F9@HK2PR06MB3300.apcprd06.prod.outlook.com>
In-Reply-To: <HK2PR06MB3300831DB8F41525C92B28708C5F9@HK2PR06MB3300.apcprd06.prod.outlook.com>

--utssQvEIn1JhAZ273DIaTgvjFviyP1avd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.04.21 um 11:21 schrieb Kuo-Hsiang Chou:
> More generally speaking, the DP501 code needs a major refactoring. It's=
 currently bolted onto the regular VGA connector code. It should rather b=
e a separate connector or a DRM bridge. I always wanted to work on this, =
but don't have a device for testing. If I'd provide patches, would you be=
 in a position to test them?
>=20
> NO, I can't. The patch was verified on AST2500+DP501 before, so the cor=
rectness of this patch is promised. But customer always requested to send=
 the platform back after bug fixed. Now, no DP501 platform on my hand, bu=
t I try to convince custom to get the someone platform.

What's the hardware platform that your customer provides to you? I'd=20
like to do more development for the DP501 code, but the hardware is hard =

to find.

Best regards
Thomas

>=20
> Best Regards,
> 	Kuo-Hsiang Chou
>=20
> Best regards
> Thomas
>=20
>=20
>> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> ---
>>    drivers/gpu/drm/ast/ast_dp501.c | 139 +++++++++++++++++++++++------=
---
>>    drivers/gpu/drm/ast/ast_drv.h   |  12 +++
>>    drivers/gpu/drm/ast/ast_main.c  |  11 ++-
>>    3 files changed, 125 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_dp501.c
>> b/drivers/gpu/drm/ast/ast_dp501.c index 88121c0e0..cd93c44f2 100644
>> --- a/drivers/gpu/drm/ast/ast_dp501.c
>> +++ b/drivers/gpu/drm/ast/ast_dp501.c
>> @@ -189,6 +189,9 @@ bool ast_backup_fw(struct drm_device *dev, u8 *add=
r, u32 size)
>>    	u32 i, data;
>>    	u32 boot_address;
>>
>> +	if (ast->config_mode !=3D ast_use_p2a)
>> +		return false;
>> +
>>    	data =3D ast_mindwm(ast, 0x1e6e2100) & 0x01;
>>    	if (data) {
>>    		boot_address =3D get_fw_base(ast);
>> @@ -207,6 +210,9 @@ static bool ast_launch_m68k(struct drm_device *dev=
)
>>    	u8 *fw_addr =3D NULL;
>>    	u8 jreg;
>>
>> +	if (ast->config_mode !=3D ast_use_p2a)
>> +		return false;
>> +
>>    	data =3D ast_mindwm(ast, 0x1e6e2100) & 0x01;
>>    	if (!data) {
>>
>> @@ -271,25 +277,55 @@ u8 ast_get_dp501_max_clk(struct drm_device *dev)=

>>    	struct ast_private *ast =3D to_ast_private(dev);
>>    	u32 boot_address, offset, data;
>>    	u8 linkcap[4], linkrate, linklanes, maxclk =3D 0xff;
>> +	u32 *plinkcap;
>>
>> -	boot_address =3D get_fw_base(ast);
>> -
>> -	/* validate FW version */
>> -	offset =3D 0xf000;
>> -	data =3D ast_mindwm(ast, boot_address + offset);
>> -	if ((data & 0xf0) !=3D 0x10) /* version: 1x */
>> -		return maxclk;
>> -
>> -	/* Read Link Capability */
>> -	offset  =3D 0xf014;
>> -	*(u32 *)linkcap =3D ast_mindwm(ast, boot_address + offset);
>> -	if (linkcap[2] =3D=3D 0) {
>> -		linkrate =3D linkcap[0];
>> -		linklanes =3D linkcap[1];
>> -		data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklane=
s);
>> -		if (data > 0xff)
>> -			data =3D 0xff;
>> -		maxclk =3D (u8)data;
>> +	if (ast->config_mode =3D=3D ast_use_p2a) {
>> +		boot_address =3D get_fw_base(ast);
>> +
>> +		/* validate FW version */
>> +		offset =3D AST_DP501_GBL_VERSION;
>> +		data =3D ast_mindwm(ast, boot_address + offset);
>> +		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1)=
 /* version: 1x */
>> +			return maxclk;
>> +
>> +		/* Read Link Capability */
>> +		offset  =3D AST_DP501_LINKRATE;
>> +		plinkcap =3D (u32 *)linkcap;
>> +		*plinkcap  =3D ast_mindwm(ast, boot_address + offset);
>> +		if (linkcap[2] =3D=3D 0) {
>> +			linkrate =3D linkcap[0];
>> +			linklanes =3D linkcap[1];
>> +			data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklan=
es);
>> +			if (data > 0xff)
>> +				data =3D 0xff;
>> +			maxclk =3D (u8)data;
>> +		}
>> +	} else {
>> +		if (!ast->dp501_fw_buf)
>> +			return AST_DP501_DEFAULT_DCLK;	/* 1024x768 as default */
>> +
>> +		/* dummy read */
>> +		offset =3D 0x0000;
>> +		data =3D readl(ast->dp501_fw_buf + offset);
>> +
>> +		/* validate FW version */
>> +		offset =3D AST_DP501_GBL_VERSION;
>> +		data =3D readl(ast->dp501_fw_buf + offset);
>> +		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1)=
 /* version: 1x */
>> +			return maxclk;
>> +
>> +		/* Read Link Capability */
>> +		offset =3D AST_DP501_LINKRATE;
>> +		plinkcap =3D (u32 *)linkcap;
>> +		*plinkcap =3D readl(ast->dp501_fw_buf + offset);
>> +		if (linkcap[2] =3D=3D 0) {
>> +			linkrate =3D linkcap[0];
>> +			linklanes =3D linkcap[1];
>> +			data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklan=
es);
>> +			if (data > 0xff)
>> +				data =3D 0xff;
>> +			maxclk =3D (u8)data;
>> +		}
>>    	}
>>    	return maxclk;
>>    }
>> @@ -298,26 +334,57 @@ bool ast_dp501_read_edid(struct drm_device *dev,=
 u8 *ediddata)
>>    {
>>    	struct ast_private *ast =3D to_ast_private(dev);
>>    	u32 i, boot_address, offset, data;
>> +	u32 *pEDIDidx;
>>
>> -	boot_address =3D get_fw_base(ast);
>> -
>> -	/* validate FW version */
>> -	offset =3D 0xf000;
>> -	data =3D ast_mindwm(ast, boot_address + offset);
>> -	if ((data & 0xf0) !=3D 0x10)
>> -		return false;
>> -
>> -	/* validate PnP Monitor */
>> -	offset =3D 0xf010;
>> -	data =3D ast_mindwm(ast, boot_address + offset);
>> -	if (!(data & 0x01))
>> -		return false;
>> +	if (ast->config_mode =3D=3D ast_use_p2a) {
>> +		boot_address =3D get_fw_base(ast);
>>
>> -	/* Read EDID */
>> -	offset =3D 0xf020;
>> -	for (i =3D 0; i < 128; i +=3D 4) {
>> -		data =3D ast_mindwm(ast, boot_address + offset + i);
>> -		*(u32 *)(ediddata + i) =3D data;
>> +		/* validate FW version */
>> +		offset =3D AST_DP501_GBL_VERSION;
>> +		data =3D ast_mindwm(ast, boot_address + offset);
>> +		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1)=

>> +			return false;
>> +
>> +		/* validate PnP Monitor */
>> +		offset =3D AST_DP501_PNPMONITOR;
>> +		data =3D ast_mindwm(ast, boot_address + offset);
>> +		if (!(data & AST_DP501_PNP_CONNECTED))
>> +			return false;
>> +
>> +		/* Read EDID */
>> +		offset =3D AST_DP501_EDID_DATA;
>> +		for (i =3D 0; i < 128; i +=3D 4) {
>> +			data =3D ast_mindwm(ast, boot_address + offset + i);
>> +			pEDIDidx =3D (u32 *)(ediddata + i);
>> +			*pEDIDidx =3D data;
>> +		}
>> +	} else {
>> +		if (!ast->dp501_fw_buf)
>> +			return false;
>> +
>> +		/* dummy read */
>> +		offset =3D 0x0000;
>> +		data =3D readl(ast->dp501_fw_buf + offset);
>> +
>> +		/* validate FW version */
>> +		offset =3D AST_DP501_GBL_VERSION;
>> +		data =3D readl(ast->dp501_fw_buf + offset);
>> +		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1)=

>> +			return false;
>> +
>> +		/* validate PnP Monitor */
>> +		offset =3D AST_DP501_PNPMONITOR;
>> +		data =3D readl(ast->dp501_fw_buf + offset);
>> +		if (!(data & AST_DP501_PNP_CONNECTED))
>> +			return false;
>> +
>> +		/* Read EDID */
>> +		offset =3D AST_DP501_EDID_DATA;
>> +		for (i =3D 0; i < 128; i +=3D 4) {
>> +			data =3D readl(ast->dp501_fw_buf + offset + i);
>> +			pEDIDidx =3D (u32 *)(ediddata + i);
>> +			*pEDIDidx =3D data;
>> +		}
>>    	}
>>
>>    	return true;
>> diff --git a/drivers/gpu/drm/ast/ast_drv.h
>> b/drivers/gpu/drm/ast/ast_drv.h index e82ab8628..911f9f414 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -150,6 +150,7 @@ struct ast_private {
>>
>>    	void __iomem *regs;
>>    	void __iomem *ioregs;
>> +	void __iomem *dp501_fw_buf;
>>
>>    	enum ast_chip chip;
>>    	bool vga2_clone;
>> @@ -325,6 +326,17 @@ int ast_mode_config_init(struct ast_private *ast)=
;
>>    #define AST_MM_ALIGN_SHIFT 4
>>    #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)
>>
>> +#define AST_DP501_FW_VERSION_MASK	GENMASK(7, 4)
>> +#define AST_DP501_FW_VERSION_1		BIT(4)
>> +#define AST_DP501_PNP_CONNECTED		BIT(1)
>> +
>> +#define AST_DP501_DEFAULT_DCLK	65
>> +
>> +#define AST_DP501_GBL_VERSION	0xf000
>> +#define AST_DP501_PNPMONITOR	0xf010
>> +#define AST_DP501_LINKRATE	0xf014
>> +#define AST_DP501_EDID_DATA	0xf020
>> +
>>    int ast_mm_init(struct ast_private *ast);
>>
>>    /* ast post */
>> diff --git a/drivers/gpu/drm/ast/ast_main.c
>> b/drivers/gpu/drm/ast/ast_main.c index 0ac3c2039..3976a2587 100644
>> --- a/drivers/gpu/drm/ast/ast_main.c
>> +++ b/drivers/gpu/drm/ast/ast_main.c
>> @@ -99,7 +99,7 @@ static void ast_detect_config_mode(struct drm_device=
 *dev, u32 *scu_rev)
>>    	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
>>    		/* Double check it's actually working */
>>    		data =3D ast_read32(ast, 0xf004);
>> -		if (data !=3D 0xFFFFFFFF) {
>> +		if ((data !=3D 0xFFFFFFFF) && (data !=3D 0x00)) {
>>    			/* P2A works, grab silicon revision */
>>    			ast->config_mode =3D ast_use_p2a;
>>
>> @@ -411,6 +411,7 @@ struct ast_private *ast_device_create(const struct=
 drm_driver *drv,
>>    		return ast;
>>    	dev =3D &ast->base;
>>
>> +	dev->pdev =3D pdev;
>>    	pci_set_drvdata(pdev, dev);
>>
>>    	ast->regs =3D pci_iomap(pdev, 1, 0);
>> @@ -450,6 +451,14 @@ struct ast_private *ast_device_create(const
>> struct
> drm_driver *drv,
>>    	if (ret)
>>    		return ERR_PTR(ret);
>>
>> +	/* map reserved buffer */
>> +	ast->dp501_fw_buf =3D NULL;
>> +	if (dev->vram_mm->vram_size < pci_resource_len(dev->pdev, 0)) {
>> +		ast->dp501_fw_buf =3D pci_iomap_range(dev->pdev, 0, dev->vram_mm->v=
ram_size, 0);
>> +		if (!ast->dp501_fw_buf)
>> +			drm_info(dev, "failed to map reserved buffer!\n");
>> +	}
>> +
>>    	ret =3D ast_mode_config_init(ast);
>>    	if (ret)
>>    		return ERR_PTR(ret);
>> --
>> 2.18.4
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--utssQvEIn1JhAZ273DIaTgvjFviyP1avd--

--WbwMXHLLLun9aM9P6NsNCyNHCoblkJXIZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEJBSkFAwAAAAAACgkQlh/E3EQov+Ap
FxAAlV7NMVotZbskszqHpMIwPVIxkDt4A0GMeXda8UaFE8PWhzJRkc7/bqP00svg4I1bp5nBCmVX
fmeoLcefspMISK4wZ7Jnn8uj0apjssw56/jtQrOvOGMLCUDTQTZyOkE9XejvI+8LOasjZ8Tantct
N9LmCNY2mafdxtuiQGcIyuGhcmekWJM7eScYOOaAF/r6I50AzZD0SP279QSvXdYERYhauSe3bcSr
sma5lcOQ1aGRbSKSSUn4SpMso+b/HoB114Q3/YuACNrrgTRVK0vuk0BT8oYu/hUhhDsQazGMhau8
Cj7PlceIgTcZebDM9Tifq7M1tiUmBYBfSnPZ+bTfDj6IKLv7Ja28cof6Jn7dylF857Fjrl8x1IG9
8rCHbfo4Vi0d85UG8/QdgChLn0L05Ew0aKa0YFFfWEF+bTpvmoNyYRZzXK3F6JzmKa48ouky+lT8
A3qCCu0vOejyYZhQrVc4HVII5UYTOULkKeejMPLO9rdpY6WP5v5U9WbCSTTgwVrO6t20kxOvO547
vV+qt6EvdRHz8tExb7j3J0RRGY1lXIy5L/80lzd0EvEFHdof96vIee6s77qBlqaYIZmRFYpVaAap
AECZskxoQ06AW8q8CimnvF03h0WSgnV66ciqsyHLeSPfpmrIhQoe10JDkkvWA5YTm9GvK+QZjgg5
Xrs=
=lizr
-----END PGP SIGNATURE-----

--WbwMXHLLLun9aM9P6NsNCyNHCoblkJXIZ--
