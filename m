Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF614F3B0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 22:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B8A6FBE9;
	Fri, 31 Jan 2020 21:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2A66FBE9;
 Fri, 31 Jan 2020 21:22:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnhnmBxwKzQkM8Nb+4CjeYEhv1+myN79d+MxJ8Lnl+MTNLY1pzWGoZkg2vkyqM9LgaSbsn4VJwhmO+SVbnd3gU6ymdf7HpgkcWigRmHofUSPBHgqQzAj0wtZf55OL+iepjHsc6yuTDaIeFoulnh//IPUDvFWo6mBPk/FiMKGIta63EAgDyCiCGIVHUqeLIoqm6fYVETe+uJ9D1dNpcf+lFeA9N7YcxGnwzeTqWjvQyZW8W26PTFCVD4llDunFCHF4FReAXTurssiGo8UmgclXHhDdPykjPDaythHMfbMGPtxI8FtdxHzssRUCcZsnqMjTvvELulPokFMNjVaZIDJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xus+Y+PXB7XA7OPKvZjQxpqz3IMYgLgN1wGN5utPdm8=;
 b=Vh5yt9jnY3OWzsPCnvqgCDBxscIQM8kzdIufescPx8XrEUMblarpQ7O8r/cRUNsDlYXMIKgg+JAVPeqvIh4pdfmiZ8aA3OsNhi5XOHRrhQCIVvoubE09lWxGYYlsqcnBAhpqw/UVmxT6+SjnrH0zBTGCpaBENNjnkfghPM/KyFIwn3+kCqg07VV8NYoji2cjin/HV2t9vZOvsDu6kaYlgp4kttqxRB8e+eoH4uB09YFtTzngS8Vk9WNqVXsKlz7uEZy30vWrh533KJ7Fs1wKaByqrXVTpB1wDfEKBCDEK+izVLryTjG6EuXUSMWmxKYz3Xtc5bI3yrfrQS9SY/dJkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xus+Y+PXB7XA7OPKvZjQxpqz3IMYgLgN1wGN5utPdm8=;
 b=GGXOnDB4dGSOgaSbh7sUONohsanX+MCI/toKExyle5D/KNjz32dbo0z6zQ0YIzCj4q3ijcsSHui2mBzuNG4e9gT1oljpEuzMJpVCFX52BVa6Pgq+hFVUyqf8QMeQrV4flN4Q83zl5ZXOiRfPXZZj3zMdxwNDmzG/V+1cXpb9qcw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0166.namprd12.prod.outlook.com (10.174.54.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Fri, 31 Jan 2020 21:22:17 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f%9]) with mapi id 15.20.2665.027; Fri, 31 Jan 2020
 21:22:17 +0000
Subject: Re: [PATCH V5] drm: Add support for DP 1.4 Compliance edid corruption
 test
To: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20200131202451.8994-1-Jerry.Zuo@amd.com>
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
Message-ID: <45c18301-8574-293e-5d44-c94b39efe7e3@amd.com>
Date: Fri, 31 Jan 2020 16:22:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200131202451.8994-1-Jerry.Zuo@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::49)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [10.4.41.130] (165.204.55.251) by
 YT1PR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20 via Frontend Transport; Fri, 31 Jan 2020 21:22:16 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 00f48d21-b0f9-4344-fe34-08d7a693a5e1
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0166:|CY4PR1201MB0166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB01660932C7AFC26165725F418C070@CY4PR1201MB0166.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-Forefront-PRVS: 029976C540
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(199004)(189003)(66476007)(66946007)(66556008)(2906002)(478600001)(81166006)(81156014)(8676002)(8936002)(4326008)(36756003)(31686004)(6486002)(53546011)(54906003)(16576012)(186003)(5660300002)(16526019)(316002)(26005)(52116002)(2616005)(956004)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0166;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nHB/CMG9qkfcpZ2RdSsPG/Z470PAgSRimtJihm/Ou2TnPOXkrLh0xfwPUPNCfsSHVV7ho+qhVkZnuw+0RJQVMOC3L3eUzJGCGm+t+irHWBSGE7y2zMf6TCFA71DrdPB9tfwRLPsygV6ja4yUHO2Y2EwDYKIgqGhGpOlUsVoQe0P6CoQA1qgQ8cUXLssaZtiPLG0AKVUR9bvC3GHxeBfhtHv3l/kzS3GF43yWUPEqBkG9WRW5+OVWm11L4ngGD1Pgn13EW00YngSCjqgCP6I2AVh1C6jaQJX3Zw4PLxIaNG3V+wqbz5b/9eT4OPPap/zL+lO25GchWxjhKtF3NqfTZN0ign88/DuRjA8CNkhW1+d2C7woS7cNbLKkfYZVVSrE41vPV0tGdKZi4XvrV1UUd/P9qfwiQHElICuTQIl9uHRPXbWbY16sClgZZygf+ce8
X-MS-Exchange-AntiSpam-MessageData: UfYURckMj4x6jqzwWismYTAhJQnznSlt5VRRKK/tfrNnKL6bPHcIGdz0fq/u0zqfwGumtM+xYWhkYy+Ivkw0TJEJWXnhYFHIiWMjSrYXyNLzrbdkq934DRXfBMi9+RNftEqnl1KcZUiWRMlPf8vVjA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f48d21-b0f9-4344-fe34-08d7a693a5e1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2020 21:22:17.2587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8hXnEWEtwlTPCAotX1uX2SoFcoWK0MP9WQ3VVZJq7FVFO6crvyVSM8Ylc0CySqaZhUc9BUoBpeiG3kZM6S8pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0166
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

On 2020-01-31 3:24 p.m., Jerry (Fangzhi) Zuo wrote:
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

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/drm_dp_helper.c | 35 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_edid.c      | 23 ++++++++++++++++++----
>  include/drm/drm_connector.h     |  6 ++++++
>  include/drm/drm_dp_helper.h     |  3 +++
>  4 files changed, 63 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index f629fc5494a4..18b285fa1a42 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -351,6 +351,41 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
>  }
>  EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
>  
> +/**
> + * drm_dp_send_real_edid_checksum() - send back real edid checksum value
> + * @aux: DisplayPort AUX channel
> + * @real_edid_checksum: real edid checksum for the last block
> + *
> + * Returns true on success
> + */
> +bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
> +                                    u8 real_edid_checksum)
> +{
> +	u8 link_edid_read = 0, auto_test_req = 0, test_resp = 0;
> +
> +	drm_dp_dpcd_read(aux, DP_DEVICE_SERVICE_IRQ_VECTOR, &auto_test_req, 1);
> +	auto_test_req &= DP_AUTOMATED_TEST_REQUEST;
> +
> +	drm_dp_dpcd_read(aux, DP_TEST_REQUEST, &link_edid_read, 1);
> +	link_edid_read &= DP_TEST_LINK_EDID_READ;
> +
> +	if (!auto_test_req || !link_edid_read) {
> +		DRM_DEBUG_KMS("Source DUT does not support TEST_EDID_READ\n");
> +		return false;
> +	}
> +
> +	drm_dp_dpcd_write(aux, DP_DEVICE_SERVICE_IRQ_VECTOR, &auto_test_req, 1);
> +
> +	/* send back checksum for the last edid extension block data */
> +	drm_dp_dpcd_write(aux, DP_TEST_EDID_CHECKSUM, &real_edid_checksum, 1);
> +
> +	test_resp |= DP_TEST_EDID_CHECKSUM_WRITE;
> +	drm_dp_dpcd_write(aux, DP_TEST_RESPONSE, &test_resp, 1);
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
