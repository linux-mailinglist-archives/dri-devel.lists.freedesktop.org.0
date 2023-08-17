Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8573B77EFA4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 05:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58BD10E3E6;
	Thu, 17 Aug 2023 03:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA7910E3E6;
 Thu, 17 Aug 2023 03:49:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaITiyYCb9o6xVdQ8nuk276si+Zmcj/cZE+jD2UjeVcuztU2xtaxU6CBtfUXKy+eymX/2b6CZ5vLYWGBQfVRweFy7y0rGDor88S4SExB/2RDYIxLiy32L+tifJwYprBP73shV7eI2y7CS9fBPcHxf3+FATAYGLpsS40rkz2C4YGJRff2rlvCqAJDA1AQxKga+Jt4YShuvugx3iAd5DkIxGrT44VXCpu7VsU5tkbWYYXW57JMS6uLKduGxJYhj9kQCpNbvOnggWSb5Q5lTjxFbqVxGNf0dFbE5EkTMliotwfJrlWA4dg8pxCWLjZ63T7OZSO8giNoALh+VT/8Pops/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxMoHM8jBuQRvs3PYArpkhlQtZBm3SG9a3LBVPnNeP4=;
 b=RQd2hOUVq25gQA2I5hicM1o8+eDHlLCvsOkNK/7azODQSAzfqNJqDVTZroeCBBix17IbFbIteIdO3VRuQETiXjfj+RADLXPndw4x9qSv+43U/kYXYE/dVKfoYXAPAAKAUL7WWK9dvC70oZ7HJLFJMBavXTmGicb6KBPTzDYQySR+O3IrghJQibFmsWcGhxRbKrovsCuwU+4FdM7z+bPxDBwCMJTqMw82B7JcdWiLr5EMr3P7i5+PgFqhcWd0+OIKV/TYGBEW7tOxhefRXodXX5/H50YGPJK7tX8yIaIGghtYFIih9o7UXGElrguvu76swCr2BLHCvggBabKTsnMgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxMoHM8jBuQRvs3PYArpkhlQtZBm3SG9a3LBVPnNeP4=;
 b=a5Db/T0D3nYjWyJpN53HtL+SsszN66SRTZh0ow8UhL7qGYuP+RwvDQOOvR2l6dIT7e6z/VaEW3PCnLFFooUxTrZyS2Ll2Dvt4BStulpGJuGzIDn63fL4URDHOdUhANdz+vitJFPRXOkfuhEaf7bpXKgsSV1Ic7pesW3VWNuDqCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by PH7PR12MB7162.namprd12.prod.outlook.com (2603:10b6:510:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 03:49:15 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0%4]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 03:49:14 +0000
Message-ID: <6e10c467-5e78-db73-6e8f-914946408033@amd.com>
Date: Thu, 17 Aug 2023 09:19:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] Documentation/gpu: Update amdgpu documentation
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230816035603.690383-1-lijo.lazar@amd.com>
 <CADnq5_NwgrvS4tdwX9Tg=1nLU8iJck2tjKfRLVU_vR3Xi=NrLg@mail.gmail.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <CADnq5_NwgrvS4tdwX9Tg=1nLU8iJck2tjKfRLVU_vR3Xi=NrLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::31) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|PH7PR12MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b13ca39-7bd1-4d7d-4acf-08db9ed4ec33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJ6F+iXCeT1lrKNSDw24VBVakG97WZf+L4cULh5eme0X3HnnAavliwk28XuLnPuFePi4MiG/6KXoCWxh4jVvbgvHScDkCkJs5h2n7aFe24sDPuJ+meLlx4CfUN9HiIHnqzd7TH7jFUhZauGJzeAOow6p7y922CGLYl3Nj2nQCdaaV0k2dsQPXiXliTd4jYqDtxA81d6/GhszVuu8P2pSwusgZyxsFZUN/cjoGjtBi6VkkDL4yFzBsSSgQx6e7oer1qWk+VPg8ZnkjdDRC0BU6reBa5okTStaFerw0CVFAikL8bNQnNV4Nh1Fy3jS33vZPGqYrHYjRf2rimsvXGDqVzvd+m6jL+HrxXX9c1nG97CUjfavq1AxRlWKG61pjdC3TceGIaS/+EVJj1Zf2mrqmxhhLA4arpDqQUblDg39Vg5oYlqHZXRdCE5OF7hW977kufhdWMqvSGu1xF/GUq45YtxK7qJztpips6CpnvaxUloF7Y3T4j8zepw7sl5ou5CWftIPIMddcWoPIEpGLZA0Nl7sQwsRmtxLOLymZBkARqae3Rel9ZuZ+4SZR8ACj8NBvAqyVjp1IqMu4rCR3E72yVZ1Ovc5ZZ1RwhRcEXnsFqoPaBItgOjhExg41Ob7RqZwnvCFWD/hZwfAftJtdabt4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199024)(1800799009)(186009)(316002)(6916009)(66556008)(66946007)(66476007)(31686004)(5660300002)(41300700001)(38100700002)(4326008)(8936002)(8676002)(26005)(2906002)(15650500001)(83380400001)(478600001)(86362001)(53546011)(6512007)(31696002)(36756003)(6506007)(6666004)(6486002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkxsckVpUkxqM2xLOUI1b1h0YXhjTWhCVUZaZ3pIYUJ1bG5QekIrU2s2VGMw?=
 =?utf-8?B?clY2TE45Q1FROGxoLzdKR1EzeVRjOVpDV0FBUXdiNU01RDk0ZTJNSjBhM285?=
 =?utf-8?B?cGRVV0xaZm9DMmpHTmdJTGQrRUx3aWtud2xYaWRrNUtvNUlCZ0hsL3QvMytv?=
 =?utf-8?B?T2JIM2tId1AwV2RxRkFUNDQ0SjZ5L0tVdGlURVY3d1o1YlM2S1F4Wnk1OGgx?=
 =?utf-8?B?dFNvUXordE9HdGhONzFsNEJHY2FaY244WXgzTlRNN2NiWjlaQmYwb2ZvZktF?=
 =?utf-8?B?YmRzZ1F4S2ZUbkdwUUx6QlR5eEpLOVNsUFZwdnM2b1d3QzVhUFdrY0thM1BS?=
 =?utf-8?B?aG8wdDFSd2FxVnhTaVBLZHdBOFdTNmhJSkxlQ2dBRnMzL0pObk5wNm1naUl3?=
 =?utf-8?B?Uzh2YllxUFlTTGJDRFdTY2FrRmlMZmZwV0h0ZHVqdTg2aDBSTzZBelVTcjFN?=
 =?utf-8?B?MUp5REQvN2M2UVpYSVBQNHRGUGhUdGYvaWJ3ZXk4djdKa3NwenU4QUI5ZHZJ?=
 =?utf-8?B?NGFmYkhtQjNrUk1EdkM5dHJmV0xiNTdDcVhoUDZubjYyaUovK3pIdTd6QW00?=
 =?utf-8?B?KzZaU0RVSmhKOXJ1NUxRRHJLVnpFQzlFZUNLREw0RXRucUJvMDd5V2QvT1kv?=
 =?utf-8?B?UDI2aEp3WUZPUERUanUwSU9wNWtIbWpSVU9XV3l0ZG5tSWh4bHJWQnpaV3cx?=
 =?utf-8?B?MVN3Nk9LbUFYYkZOTVkyN2ZNd3VXa0I0bm1mKzkwR1VTZXo0VUw2TFlocXA3?=
 =?utf-8?B?ZWMwdkFOZm9HN1U4blg4RUtxcmluMjZjK1ZDNndmc1ZTTUZYMjhqSUN6NytD?=
 =?utf-8?B?QjJBNFNubkd1OUJGQmh4Z0ZobjNuYnlvU3MwTnM4MVg5WFFvYWM4bVlOcUZn?=
 =?utf-8?B?dWZlMDNGa1V6Y0ZqMkl0UzQrVllXcUNseEFPTU84MlNwUEVXQnNLdUd5WHV4?=
 =?utf-8?B?WWNoOWJaSUJ4ODlnQ2RMUG5SemEwWU1FMXYvKzFGM3JxNEZ1aHVKRUJLWklK?=
 =?utf-8?B?aFYvNDlRdnF6NDRHTStTWXRrcVhmMXhiTitaWktZOGdMWXFQTFhsRWtzVDQ2?=
 =?utf-8?B?cjV1dVFWZGtzR25sOTg3QUpyK1VRRk9PT2ZFWU5IMUtnLzRDWDh2Vmxzc09j?=
 =?utf-8?B?Z2ZITUQzWWlvVWhoWmRFVTh1blIraVExVE5Xd0pNZU9VMUhmWjY1N2xweExZ?=
 =?utf-8?B?c2RtbmRGeExtWTQrL2lGcFNVMUZFWGpsSVZVOXFkOU5oRUhaRUxNVVJHcWdY?=
 =?utf-8?B?bGt5UnpsL1dubVNha1EweEdyV3Jha3BTSVhTTUNDcnp4SDhnL05kZmlxS1ND?=
 =?utf-8?B?eW1yS2R4MjhlWmpNaFRHL2JQMkp4RHlsL2ZrZ1ZNeTBvaHY2Q0NudGNlR2dq?=
 =?utf-8?B?NWJWTXpMWDBSR2syVTZoZWlhUFBNTTU5RjdFYlF2OThJWDcrcDF2b3lIbTJK?=
 =?utf-8?B?TlVFRC9iTEpIRjVqYUZnNTdSNkV0SVBxWTJrUFRnVXBDRm9iVEwzWG5BUmsx?=
 =?utf-8?B?RktBMHZicjRIV1RrODg1Qm81YzVQb2hHaUl5ZjVUNTB2T2M5bFVIWU1wR25o?=
 =?utf-8?B?L0FXZ25XbDM0RS9TS294VjJuVFluTlRERlRkOHNxMXhFSXI5am43KzIyY0JB?=
 =?utf-8?B?cjhpTWc5eXliSk1GaHU2Wkc1VUdzSkZjbURqbzJSY21DdEJBWkxxNldWSHRo?=
 =?utf-8?B?SldWZHV6SU5XaDN1SkJzaWtjcldtcjlyYUI2ZDBJOUwzSDc0RzJuWWtrTEZW?=
 =?utf-8?B?dTF6NTc3aVlJY3FnZnNndTRzUnJBcXFSNERUaHdDWGpXVkorNFNCSStUS2xt?=
 =?utf-8?B?bm83VmJLSUU5WFdoODlaV2ZsbkZIY1QrN2FIa2M0MTBoU0Z4V0xLc0hDQWdT?=
 =?utf-8?B?djM3VUFZbUZ2RGNYRzhrNkY0N3pnMzdyR1VqK2VCaU12bk5YUEQwRTBVczVw?=
 =?utf-8?B?WDUxcWdRZWFBRjE5Y2Njd211WmE5dFMwbXVSdU1UVjk5YXArSE5JN3Z1L0lF?=
 =?utf-8?B?V0c3Und6cndBZ2dPMWd3eEdGUVl5QUJDSS91WEsveHFsWHVWbkRFbnltbWVv?=
 =?utf-8?B?NWxWb0xJYXExSG10LzZycmE5U2JPSFdmTjRVbW9Sak1qeXNOdmhBc0w4Y2Yx?=
 =?utf-8?Q?sm4lC9lPLqcg3++5+7iNje+Ut?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b13ca39-7bd1-4d7d-4acf-08db9ed4ec33
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 03:49:14.1548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbDTqLwTjklltnKSfVnta3ddRTg1SMOUNHasaNSNOLSZnPalrEREwe3qIYzUMd1l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7162
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
Cc: sfr@canb.auug.org.au, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com, airlied@redhat.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/17/2023 2:16 AM, Alex Deucher wrote:
> On Wed, Aug 16, 2023 at 12:15 AM Lijo Lazar <lijo.lazar@amd.com> wrote:
>>
>> 7957ec80ef97 ("drm/amdgpu: Add FRU sysfs nodes only if needed") moved
>> the documentation for some of the sysfs nodes to amdgpu_fru_eeprom.c.
>> Update the documentation accordingly.
>>
>> Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
>> ---
>>   Documentation/gpu/amdgpu/driver-misc.rst | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
>> index be131e963d87..26334e54447b 100644
>> --- a/Documentation/gpu/amdgpu/driver-misc.rst
>> +++ b/Documentation/gpu/amdgpu/driver-misc.rst
>> @@ -11,19 +11,19 @@ via sysfs
>>   product_name
>>   ------------
>>
>> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
>>      :doc: product_name
>>
>>   product_number
>>   --------------
>>
>> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
>>      :doc: product_name
> 
> I think this should be product_number
> 
> Alex
> 

Thanks, made the change while pushing.

Thanks,
Lijo

>>
>>   serial_number
>>   -------------
>>
>> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
>>      :doc: serial_number
>>
>>   unique_id
>> --
>> 2.25.1
>>
