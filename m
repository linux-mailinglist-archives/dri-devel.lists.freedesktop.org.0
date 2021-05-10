Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A51C379AED
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 01:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5BC6E976;
	Mon, 10 May 2021 23:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F4B6E976;
 Mon, 10 May 2021 23:49:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXlV5cWMK/+pRmenNsASsKk0wZYd7HqSALRJVPyFTJGukK3Uh41rIaH+vNpfdIL3IH0BvG/PzyJvD3cMBN7yEGTB8csVjiAEgStwvB+XBWd4X0fuM1OxzSOgBewPumjfCoTYXjrGdf643lFosnFe31gz4mLtZD1uog4Dm2/cGzOLEqCJHCBOys6GvBCul9P2bEe/YRdm0xCgCp65W7a1DmpjQquiHCbUG8tjN6szzjHeC17F0LENuM8V3706Kqp1A2Mb8vC5jcexlbTNP/5DXMgQOwboWsekAQWu3IW69TpzYEK4mBe7s7udfOvazNV8A7p3TezaxlFd1ba4TrKXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZQcWyGvSz9cxzGUGjN7vZ4rjRDEmbeTNt3pVZZstnE=;
 b=cDA7zGIbhdhxFtHIG5rAewnQItPChfYP5TqcP/W11aqht7zxvfwNs7+pV5pPD/iIRsffdGmZ6jZpp8phAGU81dgGAld153/VGkDRVpj6Se6r+hsFZQwaLBOlaum3tqAK1mW+89F2MrAnvnc2DgeKxFdo+fgTJXHeHgzBfOXWd6NUbfMq4lvTjWq28cPFFwUOInAhmmdQG8rC2KSnhJ1mmrHJWoZrB4Ss6+ZdXXRPq4OVVl2Jer5AZ33Z62zcpreIb5x+qh2L6Iyeggqh7wBQKVtci8qL0rWdFwWjAQDzzkU6yo6RFYVhgtmmSla33Vs+WyWF5jomvsrf7cUSAKhAVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZQcWyGvSz9cxzGUGjN7vZ4rjRDEmbeTNt3pVZZstnE=;
 b=eOIZ7cenBgTSGpV5zL32EhzBUQzGuhenbBj8l0Qoxjlou9yqApn+ii2eV2TJL98rpNSkDItPit4JY3lmpLYd7N9w95uQ7d1adSinNdmWx8yOm5LjDVncq/3FQo39a3Iy5B+b6U+dPGSyzSE1XUe/X34D+nYgUS7IvhKLR8wk8xg=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by CH0PR12MB5313.namprd12.prod.outlook.com (2603:10b6:610:d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 23:49:21 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::1ddc:e4:8412:642d]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::1ddc:e4:8412:642d%6]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 23:49:21 +0000
Subject: Re: [PATCH] drm/amd/display: remove unused function
 dc_link_perform_link_training
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Rouven Czerwinski <rouven@czerwinskis.de>
References: <20210508181951.129548-1-rouven@czerwinskis.de>
 <20210510213356.ddqnz4yyqo4ngkp4@outlook.office365.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
Message-ID: <97fc07d6-dcfa-8d04-7658-311df58745e5@amd.com>
Date: Mon, 10 May 2021 19:49:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210510213356.ddqnz4yyqo4ngkp4@outlook.office365.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN0PR04CA0106.namprd04.prod.outlook.com
 (2603:10b6:408:ec::21) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.254.33.210] (165.204.84.11) by
 BN0PR04CA0106.namprd04.prod.outlook.com (2603:10b6:408:ec::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 10 May 2021 23:49:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a19d039-6378-4b89-c954-08d9140e3bba
X-MS-TrafficTypeDiagnostic: CH0PR12MB5313:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR12MB5313B394B67652DA5E35ECEE8B549@CH0PR12MB5313.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KYHI+yZmBA/eJgXdiyCVYV684WzrdtTimIxSQbbC2S24G2FNK8wT+9ZDehmb4ZSgSWL9OY4g2oHYETydMhbnu+6lWFM2Xp+8Qqtfk85UML9J0ZVkDERJgP+9eLtyJfdbWQryGU7LV+HNpLhKB/+HVcIRvmVebCJSjxRzvHKHk9k6PZUAAwbSKWoKO8vRmiGV2LsCZei/ORBM7xIwtGN9MG2Sb0ak9tq+RgSnIvFSiW9T+dhWMTZKnLhP4AD+RbzBzKqpfOKGj4xz/x3L0T44aBWLshxx1nIT1SH23szRFdLthRx/SZ6yfV3GngNkmClUZ1IoJkVu2wp8I11+nHjiwo946PxLqlmtlU/aIw4FzvnhlGHZFKLweGT5wR6rN6D5tMNQiUaWub7WljqX1+BZscxmRdnN32HiwJTz7Mu0vap8MVEghyn8sgW9Nl8K0WS5URN5rs2mSocTwbuU1iRQiK1qdBho78krm1bNEeFwB8Yajs7BTDhuR4f/t34ZjfltNaq4z5GtclJ3yqZgGVdouCdOxXSXyHTIMGo3x20EjXN85uQJav6XvsfV0x9J7E76IQKAW8M25Fr2uTJOFEoFS/0yzT7nATupXgaFMVUrv5QCFfVUye8wp/xRwnG3+rarlAbbstYHlpGwinwcEJJyU3sgi6Jm3iIXvTBZHHV189Qf5XYe6hFrrQsJ/FJIg/+6vk+Lij/UQ1MGllM/bfIZcjRFgEc8Q87ZurxR1O5CiVuwLpWe1VmyJLAaNw5QwH3g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(478600001)(966005)(316002)(66946007)(54906003)(45080400002)(38350700002)(110136005)(4326008)(52116002)(31686004)(5660300002)(16576012)(8676002)(36756003)(8936002)(83380400001)(66556008)(31696002)(6486002)(2906002)(44832011)(26005)(53546011)(16526019)(38100700002)(186003)(6666004)(66476007)(2616005)(956004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?gunmaexj4f4WOUDcrCum3Z6JazXFfYvw35lZqtME+7lj5DlZW5vf9fgj?=
 =?Windows-1252?Q?ieqR0Ei1ofgu71L6U8/XxraR9+pInXYDYk9zQiz4ZpncZsnUo7/QaJ0m?=
 =?Windows-1252?Q?jS6i1ala8KUl9oL4ZpBjWbvKGeMLZXGpTStZ+CF7XoLVdIK8jOq3LzNF?=
 =?Windows-1252?Q?yZ+AlqAYMSvpmouYMolSv1MWBPdQoEU+m6vYHDSp04wX7JPzYbmMc1lV?=
 =?Windows-1252?Q?i0pj86pqHicV3r3KzItcoj5dPNVj3sVQq+Pa5KiIdva/QsnPUWBQxtWY?=
 =?Windows-1252?Q?xY4cNlfI5Xyh4fL1OF3ec2EqwftRB3m4goDywXHav8vrI9v2qmXuesbM?=
 =?Windows-1252?Q?BdVWEwyyjhOGcRr4tO1il+86Xxa5XHrnBBe6sY5Al3Kuv/ZlMFHieLv4?=
 =?Windows-1252?Q?Sy/piU9y6e7QzmwJNJJWbRd7DbESFfn6LhQyCQJ6dbxzRMvRQiJcG7Tl?=
 =?Windows-1252?Q?Vu1vmQK4gUt5p2cN2wtDH0rY/hZV8lseU5Q78+8LWF+vz/2Ty+ZFSOFD?=
 =?Windows-1252?Q?mNAJqlr1048S71pYMgddHPrpDGNczzqdGuGWx/LLAbf7wf3XUBauT8re?=
 =?Windows-1252?Q?geRXPGOeNICQALmnS3tjSzIalAokNyLlwx7cmuiikQaoFNtRpuHDT+do?=
 =?Windows-1252?Q?WV2rbIq/r2GIO2An2OJ2tIX8ai4n2xS4Loxaha9cOXjeONMNb/VCFDj5?=
 =?Windows-1252?Q?otD2CtfpSl8DpvsVhMfgAtn97yDV29v5JTm5BmA1m/fKjlvjzAa84+Dm?=
 =?Windows-1252?Q?uQSp/Avi68PCGrIEr2OXU6l6vrjzuK0OWZr2euLsBETfwq7mug3O3JXK?=
 =?Windows-1252?Q?cPUsav46oeC39Se/nhUFpEZnQoCIcXKvsIKYbFXUT5UBFePvfmxh8sh0?=
 =?Windows-1252?Q?Px+LjFyNpCLwjWuapxLL+N2xc/68gRiA/Xid48rO3RbU30yfFU97TUvV?=
 =?Windows-1252?Q?gkDvZiue8bQOhoR0p5MMGPIAShgHMKYwwSxsRCnPL35p5F5VYWby4n8y?=
 =?Windows-1252?Q?AWg9sU2e8eX2h+sCKpdEfafvDd9081zjcxmkg3wnR5OkoEWL1pcfVFPj?=
 =?Windows-1252?Q?nbqKp4Drl7eejv0OYCWeuXHpf8HjFiSyy/8m25OZzGPxkA0GeQj5ah4Y?=
 =?Windows-1252?Q?Xva/qwUY8zlRCSSZpBsxup2A3nLvSlQKenuC/ar4xpI+Bzo3jybJvDan?=
 =?Windows-1252?Q?np5uZ6JaFojyVtEsTLhDg6KSO3ZP3zEzRAyLtBfdhRZbWIUdrvZ1uuuS?=
 =?Windows-1252?Q?5NLjMEYbtuIHjKksROMHxOPE5g20RelojPusd6/CvrgUIBculVrxda7W?=
 =?Windows-1252?Q?Unmw6JNRgpKuvOZACaQAzp1cMlaBqFIn30yKIacZOT68ZnOdu/GR+AbL?=
 =?Windows-1252?Q?UjpklkiU9RrubpTcpjXGrjNJPtwZPFoBQljLswMzxhL3lZyQ3nm8SbqS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a19d039-6378-4b89-c954-08d9140e3bba
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 23:49:21.6229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfDOPxyk2aRGXMkc4IrOrZo4XjfKllJaZMSU40cOHFY6yyu0hBExcmAJhtkYL3juCbAsYHXAiYqKRocugMxNpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5313
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
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>, kernel@pengutronix.de,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-10 5:33 p.m., Rodrigo Siqueira wrote:
> LGTM,
> 
> Jay, any comment?

None, LGTM, and this applied already.
> 
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> 
> On 05/08, Rouven Czerwinski wrote:
>> This function is not used anywhere, remove it. It was added in
>> 40dd6bd376a4 ("drm/amd/display: Linux Set/Read link rate and lane count
>> through debugfs") and moved in fe798de53a7a ("drm/amd/display: Move link
>> functions from dc to dc_link"), but a user is missing.
>>
>> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
>> ---
>>   drivers/gpu/drm/amd/display/dc/core/dc_link.c | 13 -------------
>>   drivers/gpu/drm/amd/display/dc/dc_link.h      |  3 ---
>>   2 files changed, 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
>> index 3fb0cebd6938..55c5cf2264b3 100644
>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
>> @@ -3553,19 +3553,6 @@ void dc_link_set_drive_settings(struct dc *dc,
>>   	dc_link_dp_set_drive_settings(dc->links[i], lt_settings);
>>   }
>>   
>> -void dc_link_perform_link_training(struct dc *dc,
>> -				   struct dc_link_settings *link_setting,
>> -				   bool skip_video_pattern)
>> -{
>> -	int i;
>> -
>> -	for (i = 0; i < dc->link_count; i++)
>> -		dc_link_dp_perform_link_training(
>> -			dc->links[i],
>> -			link_setting,
>> -			skip_video_pattern);
>> -}
>> -
>>   void dc_link_set_preferred_link_settings(struct dc *dc,
>>   					 struct dc_link_settings *link_setting,
>>   					 struct dc_link *link)
>> diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
>> index fc5622ffec3d..45c927cd27ab 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dc_link.h
>> +++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
>> @@ -363,9 +363,6 @@ bool dc_link_is_hdcp22(struct dc_link *link, enum signal_type signal);
>>   void dc_link_set_drive_settings(struct dc *dc,
>>   				struct link_training_settings *lt_settings,
>>   				const struct dc_link *link);
>> -void dc_link_perform_link_training(struct dc *dc,
>> -				   struct dc_link_settings *link_setting,
>> -				   bool skip_video_pattern);
>>   void dc_link_set_preferred_link_settings(struct dc *dc,
>>   					 struct dc_link_settings *link_setting,
>>   					 struct dc_link *link);
>> -- 
>> 2.31.1
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C9724972184d64ad6e7e008d913010665%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637561717696066502%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=vUFEeBJwjTDnI9l8MGDiW8%2FoX7LINZi%2FfD4A004QfLs%3D&amp;reserved=0
> 

-- 
Regards,
Aurabindo Pillai
