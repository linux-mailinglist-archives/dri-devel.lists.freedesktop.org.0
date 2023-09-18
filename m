Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D28CD7A495C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 14:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5EB10E044;
	Mon, 18 Sep 2023 12:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC65510E044;
 Mon, 18 Sep 2023 12:15:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBjBc3Wz0pCyaG0LJDw8QN7T1TXYdA1eSrzTjId4P3266+X5REJho6aRK/Ruj7PrvVYGdg8nJOdHGFDN8ZJaq2hICph0nzU0uhFgbcbm0Rf30GMJ6YvcurvuVPBMKzE1xHuJwZGmjvfC9fKqF44vNrrn9DNqHb5bRH6j3zL9MjSphVQ2DRf6TMVBBm0WyTHSkm6HDmdNaHMgPLgMaJAFZrXfxDJQ9zAWMaUDecKKCSq2n3FhXkh41UwQltKZxq3hx868JvMBqCG+WBFQ4WMYFVqcj1HyGRrzNJF/cNQnvQiVTXbmjFIuPlbe/hZAwGaMZNG4HlMwKCbRH9I+2w9hnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYDn3sYvPAuD3MGhFfSroTqZpKboJcrzfGmGwESYpL0=;
 b=CxjhLG6ebJeJUw2aEkaFRGKdnhB6WE4tcDOcsNjmMaDBxZsDN+9+eyo+CU7uEL4Hzn0Gk7iD1P0iVYxNy6nkdHdN7tbb/dAgpMFbcJio5Xev15P7pKDehm+yFyyD+nbXfDYP1JpxUrtMTM9nT3lIbZI1yqQNC5fK2d2FIxPs+TJ4+WmeCMRXP+YWHdMH/fcGXb4Ca69RlgX3hEdh0vVh4u7mLCB0UpJ09nAW+AU3osv52hztA9QTv2vDmttLDXkP5gV+voS42rRc59bB4QGIxb7S/NopxRV5GwHwh9kakhkg8I5cki1fgFlv1HeLfZEq/vrvlZVR4sMIuJUE16HoxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYDn3sYvPAuD3MGhFfSroTqZpKboJcrzfGmGwESYpL0=;
 b=D75JuwMWOFZ20d8On9a8irumjmk2jTb2Cu5w+G+l5XkjD1MBXZGbR/Vs4gFnkOym4fEHwwI1HvAo2Q651VOvQZbcUWVFyEiX3PBniXOTWh09+0G2m2RTTA3zC2dNEU+SXAGfbhlJgBN0/S24wcPzJe6Ll+oixVMMszwVsI0t0Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3048.namprd12.prod.outlook.com (2603:10b6:a03:ad::33)
 by SJ2PR12MB8848.namprd12.prod.outlook.com (2603:10b6:a03:537::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 12:14:59 +0000
Received: from BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::3331:4281:58a0:bacb]) by BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::3331:4281:58a0:bacb%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 12:14:58 +0000
Message-ID: <f72379a4-8a15-e3b6-beec-d7a4cdf94a88@amd.com>
Date: Mon, 18 Sep 2023 06:14:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH][V2] drm/amd/display: Remove unwanted drm edid references
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20230915224926.104072-1-alex.hung@amd.com>
 <87zg1ju6a0.fsf@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <87zg1ju6a0.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0109.namprd04.prod.outlook.com
 (2603:10b6:303:83::24) To BYAPR12MB3048.namprd12.prod.outlook.com
 (2603:10b6:a03:ad::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3048:EE_|SJ2PR12MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: fa940bd5-4b11-4c72-57c9-08dbb840e00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +zJx2DMXD49s0DbglmRJFD2MZ42UNIgR2sqQX28xqrYqkrLSXg6CplnnexIP3e9PxT8jq2F4ycjB/iSGaSM5SPh+/IgxNzVaKx5Gg6PsGQRVBLrIX1YJ2ZTJTPA9LJ4puWHEqmbxRrtkXxAHc26JBJ3+Yrz5znkxOqz5xn+psHnpaMlu8EI7jeRMTyS+1U7dCLz+EK5Xk8UJ27/FjlAkU70DzQXjYGFLfs3F6ZtcQGIOZ5RZlrYne7PCbKgFZgwOK3kswmwOnnMIGuKo+zvi88JF8+SPj6rLUxPoLX9z7awY9QFFCnrvs1hbh+9daWvTWrQph/s6F9omvbx/3ADsMQ86oGJx60+7lzr9kuFadIsdG9rkVERqW0yb2pq2OZcyP9YBMuOtIiGlptIssfepey+u8j3RpU7bpqJhFPHHUVec96AEHPfU1NVcVN1ulhECsmeDXgmNkINDyds3FwiygN3QO+JVx14X+FHUgMYCs2NStBlSkjyIh1BRvdqlNcBtIuAWBMY+dirPJefK30QxKiQY1cBQ5oNqeThUJWGWJoOwocFIkhfxV8XDaEfMVi4agQn67JPZQn/FExkCUb+45ZNFL0vZ6X0HJHEnkDn5882XdsggQd0PEulR2v97cUqnziuX/baoMed9EzGP7rNtcACNSz4VxVelUlKlxczaGPw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3048.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(396003)(136003)(366004)(1800799009)(451199024)(186009)(6486002)(6506007)(6512007)(53546011)(2906002)(26005)(2616005)(5660300002)(38100700002)(4326008)(36756003)(41300700001)(66946007)(66476007)(66556008)(316002)(8936002)(8676002)(6666004)(44832011)(478600001)(83380400001)(86362001)(31696002)(31686004)(26123001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmZXbXdnT0FnWU1GRUhIUDJUUVo3MWdPMWJBd1RzNlZQeDZxb2IzbEJmbjJu?=
 =?utf-8?B?YVVyMVIvWllwU0R6cm15dkJOUlpHUTdINjVHVC9vdlJTNEl4MHBaQzBGa3ZW?=
 =?utf-8?B?RVdLVTVEUEVoTXp1Ylp4bi9xQ3NBK2tvazFiQkpCcE1BZUJpNkJLdUJ3OURr?=
 =?utf-8?B?cnRoMGtTU0ozT2VYSnVYUll6dXhDZlZuL0xTUnNGRTF0RTEzWTlwMFJiakxG?=
 =?utf-8?B?cThISFQ2SnV0Y3ZiTjlwY0tOajZwRkM4UkVnaUptMmcvcWJrRHNBZlMwbzRF?=
 =?utf-8?B?RnV4WEY0YzYrM20vL2RQOXFqbnVLOFYxRlBUd0JUcCtyQnc3MDF3QXBmK0RD?=
 =?utf-8?B?ZWdTYnltYTF3SXlyallNZFFTTkVnOWFnK0twV1lFUWlEM3h4RHR3NTRORWR3?=
 =?utf-8?B?b08rUyt6dHdUZFhLMkEvUXBnQ0FvT3BYSjlLZ29TakZZcmpQcGJCb3crTGgv?=
 =?utf-8?B?a0xReTRDRFdYWkIwN0RBZ1QxNVJTOXpEL05CcXRrKzEyb04wZmt4cUZTckVQ?=
 =?utf-8?B?R3o1c2xKK3dhK1JrM0t3S3JXYWM2NjRxN0VuNkR1OGNhWFUwaXJyWXlQTmdm?=
 =?utf-8?B?aHBpNm9LZ1NYYlZJN1d4RXZTSE1LdU5oRVB5YmdlejZKSUVDVmQ0Zk5iTEJ1?=
 =?utf-8?B?dkpXdHVGTXJ5VzlNNEdDNFJIRmtBeHlvU0I5d3RreHc0USt5LzBkTUc4TTlk?=
 =?utf-8?B?UjJVWFZrOEdiYVFvckg0RVdvamtJeXBEb0srYjFVNjR2eG1yVDlWaHJGNm5M?=
 =?utf-8?B?MXJIWWNPb2VtbzVLbXo4YTg2cVpwMW1qeG4vYnYxelEySys0RkxVc1BHZWxH?=
 =?utf-8?B?T2Y3dFRndDc5RGF0WUhGejgzUmtrVlcyUW93V3pXWGNhM0NBcHo3RVZ4MHVu?=
 =?utf-8?B?RDBkSDZEWnIrdGx0eWhPUUNnNEtja3ZUUHdWZWlLODJaZWxDSVQ4cGlTZ3Nl?=
 =?utf-8?B?TWZMOU1SeHZsZ29helNOSHp6ZWpVbE1haWZPNUhGaXkvWnhnajloY3hBYzZa?=
 =?utf-8?B?VS9YdktoWGpFL1kyNDltUGdrZzhsWFJka2dSV1VkSnRZamZhcUpOOWdXM0NB?=
 =?utf-8?B?L08yM0RyR1hFczlERWFVTGR6RkdEVjh4S0pGN2N6ZGREYW4zbldROXZNNmVj?=
 =?utf-8?B?R3lGcFVjVWpWY1hZUmVhQzVXZjIwSVpyOXpwdk80NXVZTkdYM1k1cllhV25E?=
 =?utf-8?B?VEVQUGtkT2Z5STlMQ2dZVThXKzFYVDBsb3NWdlZmWnB1dmhYYlJkR0U4cndo?=
 =?utf-8?B?cm5tb1duWmRvUm9aVzlaUUFkNWJmS24ycXJIT1d5bWFIU2p0SDY2dTY3TlhO?=
 =?utf-8?B?MzdUUDFtbzVMNWNYK2dFNVRvVmJJWVZHK3NobnkyT0xvK0xWSWg1WlZBeDlM?=
 =?utf-8?B?dW5xZzhFZHhrZ1p3SGFkVGtFejBuQ2Y3N1VlTWljMWpCNTNkaE1NTG5rMHpo?=
 =?utf-8?B?ZTVnSkRXaFd5cldjc0xvdTZMeWRVd3ZSNU5JOWczMFdLWGJrbWJ0RGQ4YjRy?=
 =?utf-8?B?UUQzNEUwaDdXSUxJWUFOdzFSM0JBWEpyaHZoaWw0ekszMy84YTJtNlZJQUNl?=
 =?utf-8?B?d2M5UUlHdVRDaG5UQVdQTHg2TEMxQ2V2Nk9rUm9pQmw4V291c3kyQy94QkNM?=
 =?utf-8?B?SCtCME5LaHBtbEVwVVJkSjhkMUlEZ0MvRDNBbjlaZjk0Tlh4OWV3VEZSdTE1?=
 =?utf-8?B?UXltbDBrWHM3ZnR4dWtncWxnK0xGOGc4YUxUaHptQ2lybE5Gc21uWHFldzhz?=
 =?utf-8?B?a2RraWRsSzdEL2p1NnlZZkcvazIxNXB2Y2xVUkltemwzZDMrME5IS2twS01S?=
 =?utf-8?B?UHJ4NDNnVlVDamY2MGVYQjRGdU9vSkxVbXlYTVlSVGtuQm9zV0NWSm1QN244?=
 =?utf-8?B?OFJXbnJBSDdxU1VGSUZlcFdkSHRnQi95UUtpdHJtbSt2byt3QjBLU3RSRTlI?=
 =?utf-8?B?Q05RWDlmNmxzc0Yvdm9NZHhrYm44d1g3S0JWYUs2MUhYWFI1L1FnN1oxMlNM?=
 =?utf-8?B?MDhTSlpoYVRoWWdUeXVZMWliR2FSWm1PYW1KWmdWQitFR3BCWjBvSEFrMGlm?=
 =?utf-8?B?cE1OMDlSeVhEQkhCM3lFL0tBYXBxazJKSmNlWUU0SCtTcTNuWUMrVGxHZmZ2?=
 =?utf-8?Q?mTZVyrjaJx0+fMY1gK67eE1B0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa940bd5-4b11-4c72-57c9-08dbb840e00d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3048.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 12:14:58.1465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGA7wl+cc9BgIntHbFwxUxtpPIGDAqm7AsmdfROcT0Nhy7Nu9BMMA82mGueRguh2NR47iRatunevw3bgIw4E8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8848
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
 sunpeng.li@amd.com, Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, daniel.wheeler@amd.com, aurabindo.pillai@amd.com,
 hersenxs.wu@amd.com, hamza.mahfooz@amd.com, wayne.lin@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-18 04:25, Jani Nikula wrote:
> On Fri, 15 Sep 2023, Alex Hung <alex.hung@amd.com> wrote:
>> [WHY]
>> edid_override and drm_edid_override_connector_update, according to drm
>> documentation, should not be referred outside drm_edid.
>>
>> [HOW]
>> Remove and replace them accordingly. This can tested by IGT's
>> kms_hdmi_inject test.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>
>> V2 - add comments for drm_get_edid and check edid before use.
>>
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 44 +++++++++++--------
>>   1 file changed, 25 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 5efebc06296b..b29ef87c27a9 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6444,15 +6444,24 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>>   static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>>   {
>>   	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
>> +	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
>>   	struct dc_link *dc_link = aconnector->dc_link;
>>   	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
>>   	struct edid *edid;
>>   
>> -	if (!connector->edid_override)
>> +	/*
>> +	 * Note: drm_get_edid gets edid in the following order:
>> +	 * 1) override EDID if set via edid_override debugfs,
>> +	 * 2) firmware EDID if set via edid_firmware module parameter
>> +	 * 3) regular DDC read.
>> +	 */
>> +	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
>> +	if (!edid) {
>> +		DRM_ERROR("No EDID found on connector: %s, forcing to OFF!\n", connector->name);
>> +		connector->force = DRM_FORCE_OFF;
> 
> Drivers aren't supposed to modify connector->force.
> 
> Why would you do that anyway? This connects EDID probe success with
> connector forcing, and I've been repeatedly saying these are two
> separate things that should not be conflated.
> 
> Maybe the user has set connector->force, because the display probe is
> flaky. This switches connector->force off if the display does not
> respond, undermining one of the main purposes of the whole thing.

Thanks. I will removed this and sent V3.

> 
>>   		return;
>> +	}
>>   
>> -	drm_edid_override_connector_update(&aconnector->base);
>> -	edid = aconnector->base.edid_blob_ptr->data;
>>   	aconnector->edid = edid;
>>   
>>   	/* Update emulated (virtual) sink's EDID */
>> @@ -6487,30 +6496,27 @@ static int get_modes(struct drm_connector *connector)
>>   
>>   static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>>   {
>> +	struct drm_connector *connector = &aconnector->base;
>> +	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(&aconnector->base);
>>   	struct dc_sink_init_data init_params = {
>>   			.link = aconnector->dc_link,
>>   			.sink_signal = SIGNAL_TYPE_VIRTUAL
>>   	};
>>   	struct edid *edid;
>>   
>> -	if (!aconnector->base.edid_blob_ptr) {
>> -		/* if connector->edid_override valid, pass
>> -		 * it to edid_override to edid_blob_ptr
>> -		 */
>> -
>> -		drm_edid_override_connector_update(&aconnector->base);
>> -
>> -		if (!aconnector->base.edid_blob_ptr) {
>> -			DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",
>> -					aconnector->base.name);
>> -
>> -			aconnector->base.force = DRM_FORCE_OFF;
>> -			return;
>> -		}
>> +	/*
>> +	 * Note: drm_get_edid gets edid in the following order:
>> +	 * 1) override EDID if set via edid_override debugfs,
>> +	 * 2) firmware EDID if set via edid_firmware module parameter
>> +	 * 3) regular DDC read.
>> +	 */
>> +	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
>> +	if (!edid) {
>> +		DRM_ERROR("No EDID found on connector: %s, forcing to OFF!\n", connector->name);
>> +		connector->force = DRM_FORCE_OFF;
> 
> Ditto.
> 
> BR,
> Jani.
> 
>> +		return;
>>   	}
>>   
>> -	edid = (struct edid *) aconnector->base.edid_blob_ptr->data;
>> -
>>   	aconnector->edid = edid;
>>   
>>   	aconnector->dc_em_sink = dc_link_add_remote_sink(
> 
