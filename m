Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B4B7ABA66
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 22:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16D910E0D5;
	Fri, 22 Sep 2023 20:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A4210E0D5;
 Fri, 22 Sep 2023 20:11:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAITQzcTyjw37ss/C95+KOePyL1CW+p8t7Gf9rTYfta92BA9M/mCL+ckAlsq869+NUJMVKTo8Rdhi0m02W9XBdvn6YBH3CDrQQeWp/kYTItN9GrBaCfgHyxwgdRtdDCJ8mSXlXnO/ecdiD0Nvja6YePhYuJOe62jRLKODDoqYXuq5l1iwYrXzeETSb0fmyO1OklE0TqUuXSCOrUu4sXLv0HM8/e7iuuE5HN9Lv4o+q5cnj/hR6C5dXdAuBj/DfwYibsCBjJlAmYlGy2Lc/DqaRFf1rFzd1ZJDNqR0eLYd2DHmKaZVIW5f1K/B8/29foa1aDS86JZ5kLXjjMLdY+r3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/elC/+E+0FgLD1JPpfrIxu1BwnPlqbzhWp/4Ta0Ow4=;
 b=k9fVfF8W8SFIpV+tsYXo4jAt+tPJSwkwrJOxqevCmcb5SIQZPqDTCaQkrNTnAEQ08TG9BGPzR5DCYY92fkrSgsu17wibE/AkxPn9gdWMww+5mzpedA/YCuBsfcApBJAaeLHdb8BDDimnygjFleHOKI06oDvTZUJHfJhs14s7jEFeNpohwcv+hjzkwTNK8MV9UDgsl1tmtHJzI6/k+PALf5+Fz8+Y9aES0yy59DHGRiqj/2zdYoOlnq9tNsAVDW7kNOUxDLF4PPWHN6DyP0sOeAKraeBvgbiasU5HyuXqiCXRWhelHF59OGHY5MsEcRD3mzEx/Mu4TYAUdbsiOOepRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/elC/+E+0FgLD1JPpfrIxu1BwnPlqbzhWp/4Ta0Ow4=;
 b=vBWuPMDtMvWmEAKEInoV59iCmhc4LIVNb5Os9WT5WK91Q7ig7MBtQiKGe1GOG2uiPmtKtAgQmYWdVFFA9KmLLVgpuDzuydoYLd8tJTUWONYmktJUm9MgU6ZuCAZ0CoA+gosDYBNPJ8TxF+s6XyzCEcjAy4uQV9Cs/CySFJhUNEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Fri, 22 Sep
 2023 20:11:38 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Fri, 22 Sep 2023
 20:11:38 +0000
Message-ID: <110eb797-c17b-4064-97a5-783e5194be05@amd.com>
Date: Fri, 22 Sep 2023 16:11:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][V3] drm/amd/display: Remove unwanted drm edid references
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20230918130455.2868485-1-alex.hung@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230918130455.2868485-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0165.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: c080c032-7e29-406e-b36d-08dbbba820da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kHfv3QnQoTt1oLve7Sl3PeL0wX9tVq3LkbpKkIAcsyukJOHBiGC1SjyfWJgwmVxTTq1BU0rGrYCxS4oIrvXhUOidyBMN2W3yW9oSGwbV7bFiPSgXADqT8UlncKv8jmiKOWHxOr6vDzyWGiMarDujjILPLHHRofNgHVZ1USzY/fLEYMwJb4uN4ephrVnE5BKk+14tbvLiJi3y/NT5rrSfgM/Qrk7QahFRbG991vkArFztlbYfSugzO+vIF/rYWKpIQdlKXSkUMb88qPu3gwK8MjnJ+MV9X+zIlwgGgKoiJg1HlD7p75ZpR437Gnz6TpKkn/IXDGceNMZfL0E3Wb2Op6hGpSel18Hb/O3ixlNarJJFfTrzAk0K0IsPqKpL3z4jgi+FPDKGV4BT0sRo1bIFc0pWoSp6GXkZbUJ87I0X3pmC0bRg77vCBT4V0zfXhY5UFLTT6qnMpqabtgHpo6QzGdCk1gbDIwRQupDsfX4ivcb0YD+uLLHRtzrycEmemg7B7QzOUcVs+dk/0rgplRm9cggeIabFIr3BffoZ3lG5MrJRBkACDsBH+4iGM/IWitfNC6qz2Tprfkttw8u26g68YxHXLf71ytOkpqA2n2AtywQJhbCD02+OyX473aZq6AcfgMmogNFoOOoh6UPsCC9Q76VXkZ6fWPsNbOVHFbapmGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199024)(186009)(1800799009)(478600001)(66556008)(66946007)(38100700002)(66476007)(316002)(26005)(41300700001)(53546011)(6486002)(6666004)(6512007)(2616005)(6506007)(31696002)(86362001)(8676002)(5660300002)(44832011)(4326008)(8936002)(31686004)(2906002)(83380400001)(36756003)(26123001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0V0cVRIblZ6UTBRQ2M1N0VCVFlnT056MzRtTXZBcVArak5kZEdBTHMzN281?=
 =?utf-8?B?dUZPeU5DZm5nNUNNZzMrL001ckF3Y2pIRHNHYWZ4L1Z6Z3JMN1NzaExqU3cy?=
 =?utf-8?B?UFhockw1QkRHWmNCcTFGNEQ0bjJIWXdPaEdJaGdFemlvaXI4T1crTnM2aWVn?=
 =?utf-8?B?ZlhqcGtlRjJXT3hpaWttbkxKUjV4dDEvVWN6bDlMcW1sTGNDUW9vTld2dWU0?=
 =?utf-8?B?YWZiLy9WRmlYcDhpbmNiS2l5N253RTNkVWxkZVhsd1BhRmgyZ0VFZ0Q3MUxT?=
 =?utf-8?B?RGlWbFVEalpMSVZTUEZZelAwNkl0UFRzV1ZzTGV1SWtEd1dEbW5jSWxmNDN3?=
 =?utf-8?B?ZTA0c2RQUHh2UUdRSGlrcXdjVXEzK3lvYk12RXJtdUJKTStNaHVpRWZFRG82?=
 =?utf-8?B?dWVRWGRwaEhxSkwvc25McENoLzl3ZWtqVzh4ZjhTYSt4Q2dZcmQ2eW5YQnN2?=
 =?utf-8?B?YVdwZUdOQTZoeDRVZ1BvcUN6NkJjUlhVNUtpVVQzdEVlUkV1NHdPS2l4ckpa?=
 =?utf-8?B?eThQTHRUbkVRZXdkQjBBbGhua2NZSDFiVjhvOEVrZVhKdVBQMUpaUC8wb1A1?=
 =?utf-8?B?d28zUy9VWll0RUFDSGRzTmdlTGNNejZ5K3FuMkZsUVRDSXoxSmxsOTFFakRO?=
 =?utf-8?B?ME5DalE5dEVXejFrZ2poMTg1NWd5K3oyT3l5S3FQWGtjMUxPR1gvbVhDYXJh?=
 =?utf-8?B?Rms1cWowNnpIVWxHUlRBQmFFRkpLWDhxQjJnd3V0V3RjRk1VcHdhdDlPaGYr?=
 =?utf-8?B?YU9naVhNZG85blY4ZCtkZHdzZ3BCekovQXBPaUVSQnJzRmFsbnFtY0tISHZx?=
 =?utf-8?B?NndITTlFdkxmSmk3NjNsKy83WjF6a29ZckhBQWJzekpIOEFTZTRsWExsL1Nx?=
 =?utf-8?B?czBVZCtpRkcwSUNJRlFvejVyejRUL3VJRGw1NlNEYnU3WEozMnpOSUc2OUhp?=
 =?utf-8?B?ejRsdHM1bVBBejRiTmhhYkJXaUl5T040dkVnbzFGZEJqYTV6Tyt3QnZmRGQ0?=
 =?utf-8?B?ZTU3aDBhT05TaDhORk05MXE1ajg2Y1VlUjJML3U1VkRtTWpmOVZ2eVEwYmN1?=
 =?utf-8?B?YjlKU2RwTml2elJid3ZWUUc2b0tkVFM0WHBPS0dONkdiMnZTZE5IeVViNDVv?=
 =?utf-8?B?UnlrQTlQSWJHc3YzZFpIN2N6bm5WaUF4VE90VmJIWDRLeTl1WG5WVFh6MDNS?=
 =?utf-8?B?ZDV5T3BEaW43VVdlYmU0cU5ra1lkcFpwd0hpc2VYYkZmcU5iR3c1Y1VHeUIy?=
 =?utf-8?B?YndKYUtKaUxkbk5waytsalFEcGhqVnEvWHdoVGlKV3FpTTRBcWU5N0ptNG9r?=
 =?utf-8?B?eGJCZ1Nlb052K1ljOW4zTHRFM1hvNlB5aE5majJiWUxzRWdnQjllQU5VN2hq?=
 =?utf-8?B?cStQSTczTUZTZ1UyQ2tZcjFmcmY0QktIanZ0d0ROVGJVaGs1RnNaQmF4cnh0?=
 =?utf-8?B?cVN4b3daQnRURHNRZk8wUWZGeHd6c3BBa3Fla3FtNDA4TUZESG5NeU9Cbzhs?=
 =?utf-8?B?U2xnZiswa2tsMnowNktld0RabmZSWEh6enhiejNGQks5T2JUdjBoU2tjVnlY?=
 =?utf-8?B?YndVVlNoM3JjTTA3dGlmaUxLYzBBWFZHaHI2aTFoTVVpTmdJK3JsSjdaMWo5?=
 =?utf-8?B?cS9jWWVvQjhraGtrVkt5Qy82Um9jaVA0Vyt6LzliZVJKMSs5YnJtOERDQlV1?=
 =?utf-8?B?eC8vSjFBMG1iVkxrellyMGVvYmZuemlSaS9rVDh2dWhlWjVHRHNKVm9OYjNP?=
 =?utf-8?B?dlFMT2FTRi8zaXNTVUJLb0p2V0FXYW96Q0dHQ3owQi92NW1PK0tWS2xlRU9t?=
 =?utf-8?B?aXg5WFAySUJMTmZZNWYyS2dodUphLzFZSnVWYlNOa0ovekdLb2kzRDN3bndQ?=
 =?utf-8?B?RG40NmxNY0JLaVZKSU9pQ1oyME1YaHhCRlRZclk2YkVrKzhBcXhWMXJDZzll?=
 =?utf-8?B?OUNJd01uNk1qV3JBbi9OQWdKSHlYZG54TTNlVW5IbmtaaTJvMXRST1I4K2E1?=
 =?utf-8?B?UTAraUdYYllaWFlBS0k5TFE2elowZ1RtWkRnWnZ5eC9EOUhuTVVKN2NYU3Zj?=
 =?utf-8?B?c1ZucmsxZEdlVk9YNWxGTHJDMmoxV1V0YnZGdlRlYXpSSzVYL2NPZFlUcld4?=
 =?utf-8?Q?l9c84HmubNPlEuIt/62d1Y6Nf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c080c032-7e29-406e-b36d-08dbbba820da
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 20:11:38.6698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rHWCo2NbDxPnYjy8o6GrxRKI19lSdCD9fJG72s0OSzmcTYOHhxPNl6HvI0H3JI4lPSWTahYVUWz2l4ZY7RAhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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
Cc: stylon.wang@amd.com, haoping.liu@amd.com, srinivasan.shanmugam@amd.com,
 jani.nikula@intel.com, Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com, daniel.wheeler@amd.com,
 aurabindo.pillai@amd.com, hersenxs.wu@amd.com, hamza.mahfooz@amd.com,
 wayne.lin@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-18 09:04, Alex Hung wrote:
> [WHY]
> edid_override and drm_edid_override_connector_update, according to drm
> documentation, should not be referred outside drm_edid.
> 
> [HOW]
> Remove and replace them accordingly. This can tested by IGT's
> kms_hdmi_inject test.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 42 ++++++++++---------
>   1 file changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5efebc06296b..3968dd9cef7f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6444,15 +6444,23 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>   static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>   {
>   	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
> +	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
>   	struct dc_link *dc_link = aconnector->dc_link;
>   	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
>   	struct edid *edid;
>   
> -	if (!connector->edid_override)
> +	/*
> +	 * Note: drm_get_edid gets edid in the following order:
> +	 * 1) override EDID if set via edid_override debugfs,
> +	 * 2) firmware EDID if set via edid_firmware module parameter
> +	 * 3) regular DDC read.
> +	 */
> +	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
> +	if (!edid) {
> +		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
>   		return;
> +	}
>   
> -	drm_edid_override_connector_update(&aconnector->base);
> -	edid = aconnector->base.edid_blob_ptr->data;
>   	aconnector->edid = edid;
>   
>   	/* Update emulated (virtual) sink's EDID */
> @@ -6487,30 +6495,26 @@ static int get_modes(struct drm_connector *connector)
>   
>   static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>   {
> +	struct drm_connector *connector = &aconnector->base;
> +	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(&aconnector->base);
>   	struct dc_sink_init_data init_params = {
>   			.link = aconnector->dc_link,
>   			.sink_signal = SIGNAL_TYPE_VIRTUAL
>   	};
>   	struct edid *edid;
>   
> -	if (!aconnector->base.edid_blob_ptr) {
> -		/* if connector->edid_override valid, pass
> -		 * it to edid_override to edid_blob_ptr
> -		 */
> -
> -		drm_edid_override_connector_update(&aconnector->base);
> -
> -		if (!aconnector->base.edid_blob_ptr) {
> -			DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",
> -					aconnector->base.name);
> -
> -			aconnector->base.force = DRM_FORCE_OFF;
> -			return;
> -		}
> +	/*
> +	 * Note: drm_get_edid gets edid in the following order:
> +	 * 1) override EDID if set via edid_override debugfs,
> +	 * 2) firmware EDID if set via edid_firmware module parameter
> +	 * 3) regular DDC read.
> +	 */
> +	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
> +	if (!edid) {
> +		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
> +		return;
>   	}
>   
> -	edid = (struct edid *) aconnector->base.edid_blob_ptr->data;
> -
>   	aconnector->edid = edid;
>   
>   	aconnector->dc_em_sink = dc_link_add_remote_sink(
