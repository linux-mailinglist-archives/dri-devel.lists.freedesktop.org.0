Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DF970FDA0
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 20:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEA010E12F;
	Wed, 24 May 2023 18:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4EF10E12F;
 Wed, 24 May 2023 18:16:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsjouPHtFFunUDYzQX2p19BpZpFIxUMZaGNv9Yyg1cqYMf9nOJyn2SWlqf6AeLSmAORoormVvmi51lY7gaYJ3D3NB0mL7Z0dtaeUYTOfd7D3leYZ6ERI9ProK7WT5FQ5P1hqF2DmRKB9t7zAOGCQHmNuLFn9Glf3tMf9aeiK5BVPYTTSqGy1Ge/aoQHe2Bbo6pYd9gHRjJK1H69dmeFgh0yNbrqSdW5WwbwK0Ms5jPme3ZjDP+P+4UOYeBo7qdKqjsTERWmG344wOkLpTbWiDmPNnQJFgfhveGAgnGh5NAaW5tkxyMkA2GBqA0ng9/qt4NWFmEGPiToGNsGNw00eIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGMmlIWaFd/CBcRpY3KGjHJH3r53+Z1/wYSw5L+SdIo=;
 b=VwtSmko5bE8NgktHwCGYiXZhniQIrpcjWaH0sk6zLW3O49FiReuzc8agkcfEw0HCldw7qyrfMUAW0Z9m4K3cvVzOppY3E5JzfUfJ/1w8HffHpl3T2OBVjmB6YyUGG3lnaNs4SJ+vsP4GvEkzMwnTOFj9SFuMztlDu3e+ewegAm6S6cW7FFFdLbQIkq4VRqlMisTCTVcCig2uD7WX+en4+j6uyA6b8FoU3PZJfPGZe02omVWUQJBX+vnqRXseOZWNb09WD8eq+QxsWibQj0VRH23jtxqeKT3n2LAwzjJdduDVy8AqgFlj3WgxSB5OxM0FJkWl4f3d7/5x8ZZDHJ3egQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGMmlIWaFd/CBcRpY3KGjHJH3r53+Z1/wYSw5L+SdIo=;
 b=gUrQJvXMEYNpxof1gIXD9nCaHdtkc0Wg8ID6kfA/BJlNAFNJdX0iWcUVtyHAotsylHcCHnuDcrA6N9zy7UXMlyooD0X3kewP8U3bhZLkwSnqg1ZtaSz3cclNbvK6jR7dlrfP7DcVAWHOSvtpl3JwmkcY8Ei+W53oCgBO2jstI2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 18:16:50 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 18:16:50 +0000
Message-ID: <52e898cd-bfc5-71e1-caee-9b20a83307e7@amd.com>
Date: Wed, 24 May 2023 14:16:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-10-harry.wentland@amd.com>
 <20230308112428.162e4160@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230308112428.162e4160@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 4353b7cf-44d2-4037-c6a2-08db5c830b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qwCJwy7Dp1uA8gihesas9YhpR4X17OpB8nTCJwmfVELnpH6b1jqN/v2ZmBG9lrnbRt+mV6XZfJqFCLaG/4PyQ2AQbf0rDtnZcxktb3x+iQBHcSMXMkPJ58E8KTN8D2PKvECT//yKTDi/iP0oryS38UW1FS9UJGgH/QNUjLNOD32pyTpYCL6grgZB5bSKt+XtWThk3PnBdMPTHEI5UiJkzzQjYAB0MKSzqhmhvCLNopwj41COnCJyCe9pZhzJXrq/BkmJOsazvElPB/yrVFHqJ4TtTwU6BeZ97OiMdIOtzGmHEOeAMaNX9CVpNPJ+g6p+FKGcIWMtQxQpe7cywbM2TgP+XajaFfPrhJ6Zt/ZpXqiPh+NTnRQeHgbjHpKtPhT/ML0/ZHWwXPHb/quafF8tBum/C2MhdhSadKdE0cTGHyIMh0GlyFNFSawU/o2oB9l8NB1DX2QQ0LFrqQpyJOXIJn4E7EzBccTRIRsH4RPtzLag3DYCSFXT9aDfguNkiqHE96yQig2GYOOjoXIEHoxaljEFCDLi9JKlAB8kdGdQKCTeVLqM6uvFIi3LpeGzF8V0D6FU6fGoCiHG9t9Su8uvL6kfWg2DyfrEaLG/bDi0qGPC5smynlgznpnohM4d44yfU81aH1sdQAIoseyOHeI5qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(8936002)(8676002)(5660300002)(44832011)(186003)(6512007)(53546011)(2616005)(86362001)(6506007)(26005)(31696002)(38100700002)(6666004)(6486002)(66476007)(478600001)(4326008)(6916009)(66556008)(66946007)(36756003)(54906003)(316002)(41300700001)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elozNDJqTUVXMmc3NHJpNFBERndvN3RRQzkyRWYxSFlhaW1vZjc0YW1TVEVJ?=
 =?utf-8?B?RFdSeElyRG9SMWg0dDVlckcwTHVqTHJnWjRGaVdlWGVkbVowRWV4bWs4bDdz?=
 =?utf-8?B?RW40NGVkYlhzR3RFbDNuNjMyS05iZ1NlbWZXV2JNUXBqK1BpTGNIdDJ4TGd4?=
 =?utf-8?B?OEhJOGtwa00rbWoyZTB5UUtieXZEeC9TQmdFUlFsWFBqT3h4MWIraUlvNlF2?=
 =?utf-8?B?UlcrVWxxSjFxRWtyNFZtM2x4N3dYWXE2NC9vUnFyY2tSUE9kb2RnSk1jV2Rs?=
 =?utf-8?B?eTRqeCtKSDNZNXVNajEvSE5BNDY4Zk5BRjRrU0oyMktla1JYM2VhOFR6c1lj?=
 =?utf-8?B?ekhQL2F5c01BRXlxMlhQWmwvbXNKQXlFUDJBQlRRdEsvc24vazdRYm9XZ0Vz?=
 =?utf-8?B?RDhqQk9hT21oTThIRDF5ZnhKdXJOb3FDM1NuanhCUEdWVllhN0huMDgrTlJw?=
 =?utf-8?B?Wnl1ZWtIb1dybEpzMk5SN3F6NTJDWHJ4bEw4SVRZWlRFU05IbnBjK2JwZ3Rj?=
 =?utf-8?B?Wk8vS0xvbFJhUU9YSEgrQlZDUklxZGZsZUUwT1ozZ0JYdklTTTNKVGk3UE44?=
 =?utf-8?B?RTVFZTRaQWlNR2VpWEltLzdjZTdjSzYxRlRDZXY2dDdRelNmSFBkZzhGUGpq?=
 =?utf-8?B?TVFGVjhFakJpb2REOFdjNlltVVdRSlRHTytDZ3RTVVZWQWxmeVFjdWM2NjJI?=
 =?utf-8?B?VVpPZDQ5RnlLYlNDNDNLa0Y5a0NxcWRSVXlDSS9RWHhnMExQcms4U1JQdjFx?=
 =?utf-8?B?bmZCZythN3pIQVltWTVHNGVqNlJPU3F3amFPRlY5SlpGK0lXMW5SL2VOUUph?=
 =?utf-8?B?OUc3M29zSFFnSkcwcXVXSVlvazNhOC9mbDdHcjh4akw1bzJkS09Ib2JmaFFZ?=
 =?utf-8?B?b3cwR21yYmw0Nm02MEc4TkhvUjg0eG5HbHcvVGoyTDlwaTc4aC9jMGJlUDdt?=
 =?utf-8?B?dmRqOHZtbERuT3V4NnVNMWEzU2VRdHduNXRENndJbDRJZWw0Y29CbUxhdVV2?=
 =?utf-8?B?Qm42M3ZEY1JMYURiaENxbkRFcFAvSWxjTURGWmkyekp6U2xRWUpSMlNybXRU?=
 =?utf-8?B?MVo1L05XakJaMkpIdDAwbkdSNzNMYVJ5LzV0UlRDaWVHRjZ1cDFrcjRMd1pC?=
 =?utf-8?B?cVEzVk15eGhvUDVYSzV4dWdwaTY0ZGxLMVRKbWJPRzlqSFVnU1N0dW0yMHZG?=
 =?utf-8?B?a0p4bFpuNXlsRWNjWktNUWZLbUdMZ0ZUUElYemhBNFY4ckRPT2ZueGlNcWNh?=
 =?utf-8?B?eXhUQlE5bFF4ZXgrTTBlanJxd1I4WkY5NE1COFBUb1JTWEJqS1B3RTI1RkhE?=
 =?utf-8?B?NEpsVzJOc1g4cGdOZ3RJTEVTNFhkYU8rbThKNFNRRXNsSzB0Y1FFbmFJVTJS?=
 =?utf-8?B?bjhpaC9iR1NhaWN1MU5nd0hQNi9QVEFkSXordEx1RXR1VkhxVkI1NnIvaWJu?=
 =?utf-8?B?a0xQYSsxb3h6bkluTTFIcllGQW83NTdTdnoyZXozSVNoY0pJMUdrNi9tdFhZ?=
 =?utf-8?B?MVhRWVJpOEFIN0JxbjdRTGJxSjQ5WXEvZ3dLNTRLcGpjMjIzSU1VeFVnU0RK?=
 =?utf-8?B?dUZMVlkxNjR2UUU4dlpjb1JkZXYrd3hkelliUDhiZmVwWWpZUGg4VnlVNkhR?=
 =?utf-8?B?ZW1qblJhWm11SENpME11Wm9BcTVJNUZTNEtqa0w1L3k3cTQrUENjQnV1SFoz?=
 =?utf-8?B?UXJmcE5SaThzOElkU0w1cVVvMElPQjFXTGlwWnJIaDJDN2libzF0V3NoRWd6?=
 =?utf-8?B?RWlMRFBPU2hnZWs4NmpxK2trU0pkR1huODRlUTQxS1gySW5XZ0JtelVVd2cy?=
 =?utf-8?B?VEtvZUR1R05GOGp6anA1TXZ6a3oxaFZ2VFhOUmlvckp0cklMUkdKbHlOQllT?=
 =?utf-8?B?KzZ1U1NOdkc4TDZ6b0RWaEdEOTlBZmlIaVNuRFFCSmtZOGV6OExjaGtBQXB6?=
 =?utf-8?B?NGUvOWFNMHNySzdPd3ZzZGV3M1FNTmxMczJOLzhiSUMrcEZzOWx6R2hiMTBu?=
 =?utf-8?B?NHRyN1VvOHlTc3VpUGxtOHo0aHJWU0JoNmZabnptbWJaUENFRXl4dTBiU1ZF?=
 =?utf-8?B?dW50Qi91d3ptOG5RUkg2ZDdoRDhFdE1kQXh2ZlBmWk5BaXMvRStyekpFVitl?=
 =?utf-8?Q?n7GpR+cPBhhlWyarjU8jgihOT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4353b7cf-44d2-4037-c6a2-08db5c830b5f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 18:16:50.6193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0T79UPhuwMweVlVHlaSKbl1W+7A+JMfsFreqCZqAt8d3AvvZAhOgY5qSeo9aLVAXUtOLEngGTm7V+TQU4mT9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6440
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
Cc: Joshua Ashton <joshua@froggi.es>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/8/23 04:24, Pekka Paalanen wrote:
> On Tue, 7 Mar 2023 10:10:59 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> We want compositors to be able to set the output
>> colorspace on DP and HDMI outputs, based on the
>> caps reported from the receiver via EDID.
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Vitaly.Prosyak@amd.com
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>> Reviewed-By: Joshua Ashton <joshua@froggi.es>
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index f91b2ea13d96..2d883c6dae90 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -7184,6 +7184,12 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
>>  	return amdgpu_dm_connector->num_modes;
>>  }
>>  
>> +static const u32 supported_colorspaces =
>> +	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
>> +	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
>> +	BIT(DRM_MODE_COLORIMETRY_BT2020) |
>> +	BIT(DRM_MODE_COLORIMETRY_BT2020_DEPRECATED);
> 
> No DEFAULT?

DEFAULT is always added in drm_mode_create_colorspace_property.

> No BT.709 RGB, i.e. sRGB?
> 

No RGB variants for BT.709 or sRGB are explicitly defined in the API
(which is based on the infoframe values). Not trying to change things
up here.

You'll probably want to select "DEFAULT" if you want sRGB.

Harry

> Doesn't DRM core reject enum uint values that are not listed in the enum
> property?
> 
> 
> Thanks,
> pq
> 
>> +
>>  void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>>  				     struct amdgpu_dm_connector *aconnector,
>>  				     int connector_type,
>> @@ -7264,6 +7270,15 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>>  				adev->mode_info.abm_level_property, 0);
>>  	}
>>  
>> +	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
>> +		if (!drm_mode_create_hdmi_colorspace_property(&aconnector->base, supported_colorspaces))
>> +			drm_connector_attach_colorspace_property(&aconnector->base);
>> +	} else if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
>> +		   connector_type == DRM_MODE_CONNECTOR_eDP) {
>> +		if (!drm_mode_create_dp_colorspace_property(&aconnector->base, supported_colorspaces))
>> +			drm_connector_attach_colorspace_property(&aconnector->base);
>> +	}
>> +
>>  	if (connector_type == DRM_MODE_CONNECTOR_HDMIA ||
>>  	    connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
>>  	    connector_type == DRM_MODE_CONNECTOR_eDP) {
> 

