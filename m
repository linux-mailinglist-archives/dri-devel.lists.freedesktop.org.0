Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 318F51534EA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 17:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0086F877;
	Wed,  5 Feb 2020 16:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A126F64D;
 Wed,  5 Feb 2020 16:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpfKW3LNYUe5VvOqPAORa7Y6UjQ29eAh/T0/XcZaQpkuMGz3uq/b+yJM/N6F6EfJ7aJToXJ8V53hDzaAPVlJrWRarpGcPuKgSj1kHNCuUkowTapWKOUuNcFgc+BguWgzOneUqPpr3+b1feGjIN04UX9meqCKRkK+YhHrIYzOeM7ssbEDrgMty+hSoi0HzBv81uYjJIu1VdYSK6CYzDfffefDejR9XOIWFQ5IePPvP9p88F17h7u16jLOm2F+sAp7bpXZmabY/SvbdV0sDxAERarubKnRwbPQTdwW5oJZK/Fc72fMVGihP6Eg6PlLbFPEkrCJ9x6fkGSig22+UlmOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gOklD5iT1krq+ufra6W18Uxs6kksIeL4YIuAwhs/Io=;
 b=X7I2Ral7GODjJmtwzxug6ALk97MxB4WixlTXW1Ztv8bzmXr4yvTJKC2Nqe+RIt/TfDB8a4tBih60Lt2F/d50Mw/HRrK5/cHlD6EhO1aTYkuHaupwgnszt8+72kkuM9ygkbAIIyabMeDx8xCUBDtQUoIAgVpBP1xQApGwVfv4vrjPRNBKhXPnU/TmaYccrLWfTUk2rmQ4vIl5Jy/3tjIF8k6iYuo2WRm+xxkmUP+jbtUVWE1CYiny7mJLz93Tk2T0d2TMLKEnTery6MZ5LrHKdSzgWTVGEn4GZ8ZUklc15uVXuo4tgbpOtWk+ZvmXMCjqGLeNcbcTFzemvAcUN02SMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gOklD5iT1krq+ufra6W18Uxs6kksIeL4YIuAwhs/Io=;
 b=zSroqMDAPOFd7gS/+Fejkph3LNlxmivS52YQpLQ+lS/NeGzoHoAXHA4OtqsBfBYYaWp0W/F+vEvI80SCHZzl6bweinLX5gKcDZcdICCRdOGWfAwSTdbLcKCpdGxdn52hnF/aNqH8CMB46CCk7NkCxESTxIWz7hDy7N+9dVeLcLg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0229.namprd12.prod.outlook.com (10.172.78.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29; Wed, 5 Feb 2020 16:03:43 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f%9]) with mapi id 15.20.2686.034; Wed, 5 Feb 2020
 16:03:43 +0000
Subject: Re: [PATCH V6] drm: Add support for DP 1.4 Compliance edid corruption
 test
To: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20200205152248.32419-1-Jerry.Zuo@amd.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <ce8ecfd7-1edb-ec8b-c9c8-275072882537@amd.com>
Date: Wed, 5 Feb 2020 11:03:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200205152248.32419-1-Jerry.Zuo@amd.com>
Content-Language: en-US
X-ClientProxiedBy: QB1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::28) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [10.4.41.130] (165.204.55.251) by
 QB1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:2d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21 via Frontend Transport; Wed, 5 Feb 2020 16:03:42 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 343e469a-d9bc-4bc6-4b61-08d7aa54f917
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0229:|CY4PR1201MB0229:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0229CD0A0476D2723DBB4C678C020@CY4PR1201MB0229.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0304E36CA3
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(189003)(199004)(53546011)(478600001)(81156014)(81166006)(6486002)(8676002)(16526019)(186003)(26005)(31696002)(8936002)(54906003)(16576012)(316002)(52116002)(956004)(2616005)(31686004)(2906002)(66946007)(36756003)(66476007)(5660300002)(66556008)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0229;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scK/n7jsX+o3AM9PrJA2y+A3/SYYxYtc0azbPNihkNv42j2cBIsOhwBR193rB/62SD/z89bpL0W8IdMc1efEIAWvE52ABNDHEol1+wZwFEp87GvFfC6qG/2BISY5TLDnj2YgIQkH61gCjPOOsm/Nttx12iZn7kud2pWOWEvv3hpqX2+c5Wjh4+WTTjhFZX4WX+7pWq2Bl8bcTuOSmy1GhCYxG+JeU0prsMUk8A/E5HKzJgdBcaphS717+mC0Tx41go0IrXVwFHHyjYiVU7uVOw3JEYYhFi2+bRaCammKsKDI0YcldLnPSXw980uisrraYTS6S3tItCIwzL0F/B1Z+JlkXdGxFrRTsYX0c/22EQeKWs/K83NKcszCkrZR2W9+L6qxN7RzwVsPVU85b9nARP1Z28sZISRktCPabCHoP/B1SKlyoEkXM4vXn4wGK66f
X-MS-Exchange-AntiSpam-MessageData: gNIcEUW8CC6PPU+6kjCL0COCkSK8pHf4bEFCE9schGLyEUPJDkovaXQnLvlMfdqEZlYmJlxxOX6+92X/LUakJ8ntu6eDJsZKKyafwnms30Q51kJuGfqYDH0lkCHBULS4sPrFO1tZuRH2OFMfa83d4Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343e469a-d9bc-4bc6-4b61-08d7aa54f917
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2020 16:03:43.2061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /G/zNp1LfTIIv/8w8QOMH8juydrbsRgZdUVmwIZuCv792NeJ3ri6TMJ3oSBO2ioEWMr4bU/zwGmBHLJp1c3Hzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0229
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
Cc: rodrigo.siqueira@amd.com, manasi.d.navare@intel.com,
 Alexander.Deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2020-02-05 10:22 a.m., Jerry (Fangzhi) Zuo wrote:
> Unlike DP 1.2 edid corruption test, DP 1.4 requires to calculate
> real CRC value of the last edid data block, and write it back.
> Current edid CRC calculates routine adds the last CRC byte,
> and check if non-zero.
> 
> This behavior is not accurate; actually, we need to return
> the actual CRC value when corruption is detected.
> This commit changes this issue by returning the calculated CRC,
> and initiate the required sequence.
> 
> Change since v6
> - Add return check
> 
> Change since v5
> - Obtain real CRC value before dumping bad edid
> 
> Change since v4
> - Fix for CI.CHECKPATCH
> 
> Change since v3
> - Fix a minor typo.
> 
> Change since v2
> - Rewrite checksum computation routine to avoid duplicated code.
> - Rename to avoid confusion.
> 
> Change since v1
> - Have separate routine for returning real CRC.
> 
> Signed-off-by: Jerry (Fangzhi) Zuo <Jerry.Zuo@amd.com>

Please make sure to add the Reviewed-bys you've received on previous
versions. I've already reviewed v5 and an earlier one. Please add my
Reviewed-by.

Harry

> ---
>  drivers/gpu/drm/drm_dp_helper.c | 51 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_edid.c      | 23 ++++++++++++---
>  include/drm/drm_connector.h     |  6 ++++
>  include/drm/drm_dp_helper.h     |  3 ++
>  4 files changed, 79 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index f629fc5494a4..1efd609df402 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -351,6 +351,57 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
>  }
>  EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
>  
> +/**
> + * drm_dp_send_real_edid_checksum() - send back real edid checksum value
> + * @aux: DisplayPort AUX channel
> + * @real_edid_checksum: real edid checksum for the last block
> + *
> + * Returns:
> + * True on success
> + */
> +bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
> +				    u8 real_edid_checksum)
> +{
> +	u8 link_edid_read = 0, auto_test_req = 0, test_resp = 0;
> +
> +	if (drm_dp_dpcd_read(aux, DP_DEVICE_SERVICE_IRQ_VECTOR, &auto_test_req, 1) < 1) {
> +		DRM_ERROR("DPCD failed read at register 0x%x\n", DP_DEVICE_SERVICE_IRQ_VECTOR);
> +		return false;
> +	}
> +	auto_test_req &= DP_AUTOMATED_TEST_REQUEST;
> +
> +	if (drm_dp_dpcd_read(aux, DP_TEST_REQUEST, &link_edid_read, 1) < 1) {
> +		DRM_ERROR("DPCD failed read at register 0x%x\n", DP_TEST_REQUEST);
> +		return false;
> +	}
> +	link_edid_read &= DP_TEST_LINK_EDID_READ;
> +
> +	if (!auto_test_req || !link_edid_read) {
> +		DRM_DEBUG_KMS("Source DUT does not support TEST_EDID_READ\n");
> +		return false;
> +	}
> +
> +	if (drm_dp_dpcd_write(aux, DP_DEVICE_SERVICE_IRQ_VECTOR, &auto_test_req, 1) < 1) {
> +		DRM_ERROR("DPCD failed write at register 0x%x\n", DP_DEVICE_SERVICE_IRQ_VECTOR);
> +		return false;
> +	}
> +
> +	/* send back checksum for the last edid extension block data */
> +	if (drm_dp_dpcd_write(aux, DP_TEST_EDID_CHECKSUM, &real_edid_checksum, 1) < 1) {
> +		DRM_ERROR("DPCD failed write at register 0x%x\n", DP_TEST_EDID_CHECKSUM);
> +		return false;
> +	}
> +
> +	test_resp |= DP_TEST_EDID_CHECKSUM_WRITE;
> +	if (drm_dp_dpcd_write(aux, DP_TEST_RESPONSE, &test_resp, 1) < 1) {
> +		DRM_ERROR("DPCD failed write at register 0x%x\n", DP_TEST_RESPONSE);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_dp_send_real_edid_checksum);
> +
>  /**
>   * drm_dp_downstream_max_clock() - extract branch device max
>   *                                 pixel rate for legacy VGA
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 99769d6c9f84..f064e75fb4c5 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1590,11 +1590,22 @@ static int validate_displayid(u8 *displayid, int length, int idx);
>  static int drm_edid_block_checksum(const u8 *raw_edid)
>  {
>  	int i;
> -	u8 csum = 0;
> -	for (i = 0; i < EDID_LENGTH; i++)
> +	u8 csum = 0, crc = 0;
> +
> +	for (i = 0; i < EDID_LENGTH - 1; i++)
>  		csum += raw_edid[i];
>  
> -	return csum;
> +	crc = 0x100 - csum;
> +
> +	return crc;
> +}
> +
> +static bool drm_edid_block_checksum_diff(const u8 *raw_edid, u8 real_checksum)
> +{
> +	if (raw_edid[EDID_LENGTH - 1] != real_checksum)
> +		return true;
> +	else
> +		return false;
>  }
>  
>  static bool drm_edid_is_zero(const u8 *in_edid, int length)
> @@ -1652,7 +1663,7 @@ bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
>  	}
>  
>  	csum = drm_edid_block_checksum(raw_edid);
> -	if (csum) {
> +	if (drm_edid_block_checksum_diff(raw_edid, csum)) {
>  		if (edid_corrupt)
>  			*edid_corrupt = true;
>  
> @@ -1793,6 +1804,10 @@ static void connector_bad_edid(struct drm_connector *connector,
>  			       u8 *edid, int num_blocks)
>  {
>  	int i;
> +	u8 num_of_ext = edid[0x7e];
> +
> +	/* Calculate real checksum for the last edid extension block data */
> +	connector->real_edid_checksum = drm_edid_block_checksum(edid + num_of_ext * EDID_LENGTH);
>  
>  	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
>  		return;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 2113500b4075..b3815371c271 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1357,6 +1357,12 @@ struct drm_connector {
>  	 * rev1.1 4.2.2.6
>  	 */
>  	bool edid_corrupt;
> +	/**
> +	 * @real_edid_checksum: real edid checksum for corrupted edid block.
> +	 * Required in Displayport 1.4 compliance testing
> +	 * rev1.1 4.2.2.6
> +	 */
> +	u8 real_edid_checksum;
>  
>  	/** @debugfs_entry: debugfs directory for this connector */
>  	struct dentry *debugfs_entry;
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 127d6e1d3338..957a3d00ee05 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1459,6 +1459,9 @@ static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
>  int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
>  				 u8 status[DP_LINK_STATUS_SIZE]);
>  
> +bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
> +				    u8 real_edid_checksum);
> +
>  int drm_dp_downstream_max_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				const u8 port_cap[4]);
>  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
