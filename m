Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D7756860F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB45611363A;
	Wed,  6 Jul 2022 10:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC581136CA;
 Wed,  6 Jul 2022 10:47:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USubOrTKKY8ihdqplonxr5GX/SNinCbGk+FVaC/bEMwBBcLywXhwxEYuYnVyI6GsKje555VoueVOQ3eDz9W08GtO6kVjvRSOhG7Z1F/SgJ158mqfWquu+sN6DtbVBYC5mujvgOAQUBfef1wObVJG52p76fFtIRlEN4jK/SdT4yR1WTNEUQzfcUJrM4T0Ds2W91FtS3VLSkjFYD6xpy1vMVE88chTZrxZDgbO3qVz9xxSXjngKG7GMmXQ9nLuecClj0ZPRMeiKIrE3P+AMn68pX5ul3PBHCqhotgCk3qrElsBA14COSkGVvyB3jlGYcnvl0m2+IEFK+IUByrlteVYqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gcx0aw2Bz8uSIBnGz9rz9ayrt1iEzMEedPsS2Fkff4U=;
 b=HasUyMGUSImiW7w/2b+V8KTNJWxx8NVOUvhPOqY7HMvDIBq11RdUGeuPz/j8JQlnZ5PYJQ1sbOenqSJn/E4Dx1Tk11nxp6pdn7FegQUPyZdYwBBRnYBfXOWO4AeH5s84oMnnx1bF5ss6Ef/k5dm1vQKTwjQNMx8Wk/cqCUCvao1m20o7j7VXQwKwK+KXYEsNz6vn/SttgG6atFivYhJoYPCcalaKu0lgDLJXIHP+rEANcyOjYRZ0I2vJO958Gu6ndpEKnvLsugFGz0jIIEbI02Ofo/i8O7hTRaHRNdOW6Ml9+wuyPnwrWMDrqtljoon5tvbA2S2QLzjZ3siEB3GIWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gcx0aw2Bz8uSIBnGz9rz9ayrt1iEzMEedPsS2Fkff4U=;
 b=3nDrRSp0ujBJ2QUc0O0HhRCsWgMliW0SsWUVkpml96Elv3kpw0GL3Q/pQ/B8FH/0OLnxVAL+LZohX/Zi+fqKLau0fE8wUixcRPjc8A1/qjb28PGZqm/jRwazW8TFzFHJpbBQU/Gmg44pjAN4W4n4uhDKsNtCBy4uOLmW9LDBfC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR12MB1909.namprd12.prod.outlook.com (2603:10b6:903:124::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 10:47:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 10:47:23 +0000
Content-Type: multipart/alternative;
 boundary="------------fEf0RDzyxlNQuL50ZnPlWSJZ"
Message-ID: <eb92455f-fa42-f866-9c5e-cb47d63a5542@amd.com>
Date: Wed, 6 Jul 2022 12:47:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: drm/syncobj: flatten dma_fence_chains on transfer
Content-Language: en-US
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "dri-devel-bounces@lists.freedesktop.org"
 <dri-devel-bounces@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
References: <DM4PR12MB515234346C965FD8936F5DEFE3809@DM4PR12MB5152.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM4PR12MB515234346C965FD8936F5DEFE3809@DM4PR12MB5152.namprd12.prod.outlook.com>
X-ClientProxiedBy: AM5PR1001CA0009.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 743db27b-85c4-4b45-40c0-08da5f3ce86e
X-MS-TrafficTypeDiagnostic: CY4PR12MB1909:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lh69lUZIJmytYCCoBEA6N/4IC+silcKPUzqA4NX5IBvm5C39FK6g2sJE0IRsItZxt90zulr26jUPYlhWxtGOUbTe2lRCVgan2whP1+Lu5hUlI6GPA9R69PijWdZRPOYRtWbe8qd0gjaCPg9/wg3Hlk9G+PvVAV8m4yX9D8OifuY4N2w2KDy5fKExcTaSbbEnbb73qLbCCNouLMwGBBRlJjFAan++lEGTtIomC9Mb4254GaNVTUwRSlb6A/YbaTXljd+g8pB8g8myNBsNimQtN+uMeAwE3WhKwbSbTS3ybe8qmBZacSQs3lk+VpvHUn7gJB5AKnZBDwgTsML8gdUq6ff7coNoQClOs9FJWQ7bCE4NllW63rcfs2okJ5i6zTFp1rQFvCdYVt2LYz1M/4pY6juVAdbzeLusyCeNW1ep8UIqTp+0BOLtTMwKjscMKLsMfotAXV/LSgGclW1UOcpLLw4YfatC2ci0Y9+aarCRZaEdbfzJnuUQ94dwh9uB18XlBRQ5vTqb7y/ZYEIF15dFXh/6uXgq6h1Pbcv0yrC8Em35gBBJ+HawgzYCXz1VFG12Og6YRdUcLpwCM6a863z42nkKUvdLK7iAZe2keZmzqETd01y6JUEjtL+WY7G+8nYLt7EQ2Qa2BP2n0+jARCItWxccQQE6904c2Ob8tdcNa4wITdFVoFD22quxWokqvHIRevfhGxG+WzsFurWFhbQx4zJessDOl932w99OjJWOsgAf3NfmWgWBB5ZET3UGXbfQ/arI90ht5ZwTgnzzn94Tx3w+pbuN4Zx2jm2pkaNY/ykmj6yUyuXE9gN4n9ETkz/0Gv7YGrPfmYnbBFUDEORelppr1hgLNA+joJ2vieOj9hg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(6506007)(316002)(86362001)(478600001)(8676002)(6666004)(33964004)(110136005)(41300700001)(6486002)(31696002)(2906002)(54906003)(38100700002)(66556008)(66476007)(8936002)(66946007)(36756003)(186003)(2616005)(6512007)(31686004)(5660300002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVZURlBpN2VsdlR5T3RkMjRHS2R0NVZ4b2k4dFpja0tVYlNMQmk0ZXVRdHUy?=
 =?utf-8?B?eDVaTklkWG5qMnFFaDh5b3M5OHB0SlJkWUZKRkhlczRTbXNXalJTV1ZOMU1H?=
 =?utf-8?B?ak5ZOGFvWDVlSUhKNGVQQ0o5WnhiaXJZcUFCVkdSVWZTVm9uQ3dtdmhoVnQ0?=
 =?utf-8?B?Z0VEZ0JsMmFqOWxra3RvQU9rcEhJL3hhaGJHOW5ONTkyOHBYenh2STJldkN3?=
 =?utf-8?B?YU9rQVAwSGJxUXdGYXc2NTBwaGZSR2hWWkR1VDRWZzJzNnJvM3ZMNmhUK25H?=
 =?utf-8?B?UHEyOHdsYmNSUHhTWXRWUEJPRFQ4ZFA3VDBQTUswZzF1V1oxOHZjMmU1TzRw?=
 =?utf-8?B?TmNaRWhYQzV6bVBPUW1nY2RoK1kwSVpFTjBaZlh6ZmlhRSswMjBlb3g0cDF1?=
 =?utf-8?B?RmV0cEx5Q3pDMGlRUEhIWXJKS0thK0JPQmpNVHVCK0hnSmQxV2kwYyswWklK?=
 =?utf-8?B?OXNNSWxZU0c2TVo1NkYzamFWUVdEMUZPSEVoaTVFNEJISE83b05DWjhsMGxY?=
 =?utf-8?B?Y0F2dGJlMUgvSThpRGZPcEVCbXdvTmloOGlXMHRidWxJUThpYW5pMXBLK0Jt?=
 =?utf-8?B?VlNLek52azQxMS9TcDNkdFdwRG5rbXlwMDZXVzBwYWZMOGI5bUtxRXVCSTU1?=
 =?utf-8?B?TExERUEwYlBpUnlscWdjUUdyTU5XTS8zSmhrOHdDdVlyTURBTEhHcGxuMzE3?=
 =?utf-8?B?T1VlVjVZZlhYd3haRjJIRWxwK1ZPdUh6NnpnM1lnWXhYek43bUhEMUw4dlhu?=
 =?utf-8?B?Y1JDMW96OUNHalpYY3gzMU9JdWc4Y1R3TGJidlJtMWJxOVdoUlRSVVZYaDVj?=
 =?utf-8?B?L0xVZWpZdy8zTDFHM3hLSVplSnVGeWs5QnNTTkMxaFJUWU5VaTZvdXd3eUFt?=
 =?utf-8?B?UHFtWTNseTN1Y09vZ3JXSm94UjdjSXNHOERoRzRWUjZWLzgzbFltUi9ORVUv?=
 =?utf-8?B?NVpEaTNQNGtDM29mQ3FISThpVHE5MXFSWXIwV1BVeVQzOXdvZkZZMUhIUFVs?=
 =?utf-8?B?OEJ6MXVVVU1JQkYvYXNvMnZENG5SSDBvUmhSekVXdmpHZDdTQktXU0tSclJr?=
 =?utf-8?B?RlNDdG1xWWZJTGNka204OTRlZ1REc1o0SndMcnAraUxCaFVjTGNtdWN2bUMr?=
 =?utf-8?B?QkFCZmZPaUljbk5FajI2OG5uV2dDUy9vbTVtT2VjQUp1ZkgvNEdhSTFsYSth?=
 =?utf-8?B?RzlmUWV5dDdsZERrTVBuQUtnSTlOUTQzWExXR05OSGtLRW1vQk9talFCellm?=
 =?utf-8?B?WGVTOTVuV0xwRlZsVGZ1R21velJrak5NaEE2SlhoZ3c0MlVPbjdLY1duL0xt?=
 =?utf-8?B?OHlWZmFmWU9GOEhKOTdvNkxBeEhZaVJFWWppVk45a2JISGpKdGFJODJ3R1NT?=
 =?utf-8?B?OS9jTk5RTUwzNjB6WExHai85ZHBISVdjOURhNUlFblNFamxlcXJMQk9uZGdz?=
 =?utf-8?B?WVFucE1KN21yUkdsQm9lRGtuSDlkcFJWTXpyQnU5UGNkY1lDdGpGUnNsOHNK?=
 =?utf-8?B?YStJYXJCYmJOeEVwdEI5dUdSUE9VY2taSElVYVRsdyt4bTJPaDN6bG50Ymxl?=
 =?utf-8?B?MEtHRHBvTi9YWVUzeGxXVXE1aDE4b1JzaU1GeDFGVmxZa3Urb2trbmdmRlFV?=
 =?utf-8?B?NjhzdE1nT0wwNkxMTWx6K2cvbWRUY3lEdWJmOXZqcHkwQ1ZGTXdmRWVCYlpE?=
 =?utf-8?B?aUd6QjBjY3crbGJVNVUvS0d4NFloWDJBbExnYVpocHV4czhVTEUzUTB1dEdm?=
 =?utf-8?B?ejhWZ0g0dndNdU9hbDFSTjlLbEhHLy84NDhTSnZFbHUvOHp6TFIrRUpFN210?=
 =?utf-8?B?aUdnUWpia2ZKcHFlWVh1TDR6TmRsNUFITE1hdW9tVmp5cGNxek44YTVrRWpp?=
 =?utf-8?B?ODgwSUtjUFBDcGNJZFVqS2JOaDhUdUNYb1N1b0N3MVhIYmpQYUc4TTdtak9J?=
 =?utf-8?B?YjhTSllveWlMN0tqRmNIdnViQnMzZElzWllWZkQ1eEtXUUxZMFZRcVdnZ3dF?=
 =?utf-8?B?OG9SUlpKTlpsdnhoTGV5c2d6Q05jOUlvSzUzN0Z0UVFRRVBkNHhTbzhKK1RG?=
 =?utf-8?B?THJNUnhVYzYrRk42Q2wwN0F6b1JsOHRXYnFsSHpjVHBKUExvVW9kRlVPeGN2?=
 =?utf-8?B?K2x5Q0J5N01tN1N4TU5WbGlaeEh2SWQzR1JjcGM1eHJtZjJVZENaVnY3dkNB?=
 =?utf-8?Q?YmsBDoTsxJ66uxs44toHdlf414tJpXEiXZ8Ks5+4uTQM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 743db27b-85c4-4b45-40c0-08da5f3ce86e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:47:23.1062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umd0npNMNv5zG0XUCvmy+w5foXALhS8aY83q1iEKdNShiwgMmHsdZdtuv7FJDSAo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1909
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
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------fEf0RDzyxlNQuL50ZnPlWSJZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jesse,

not sure how you created this, but usually we use "git send-email" to 
send out patches. That one here looks kind of mangled.

Additional to that this is most likely not the right place for the call.

Regards,
Christian.

Am 06.07.22 um 12:41 schrieb Zhang, Jesse(Jie):
>
> [AMD Official Use Only - General]
>
>
> Fix sync syncobj issue by enable the signaling of the base fence.
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>
> index d5db818f1c76..971ad97a2f54 100644
>
> --- a/drivers/gpu/drm/drm_syncobj.c
>
> +++ b/drivers/gpu/drm/drm_syncobj.c
>
> @@ -887,6 +887,7 @@ static int drm_syncobj_flatten_chain(struct 
> dma_fence **f)
>
>                 goto free_fences;
>
>         dma_fence_put(*f);
>
> + dma_fence_enable_sw_signaling(&array->base);
>
>         *f = array->fences[0];
>
>         return 0;
>

--------------fEf0RDzyxlNQuL50ZnPlWSJZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Jesse,<br>
    <br>
    not sure how you created this, but usually we use &quot;git send-email&quot;
    to send out patches. That one here looks kind of mangled.<br>
    <br>
    Additional to that this is most likely not the right place for the
    call.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 06.07.22 um 12:41 schrieb Zhang,
      Jesse(Jie):<br>
    </div>
    <blockquote type="cite" cite="mid:DM4PR12MB515234346C965FD8936F5DEFE3809@DM4PR12MB5152.namprd12.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <p class="msipheaderdf3d92d6" style="margin:0" align="Left"><span style="font-size:10.0pt;font-family:Arial;color:#0000FF">[AMD
          Official Use Only - General]</span></p>
      <br>
      <div class="WordSection1">
        <p class="MsoNormal">Fix sync syncobj issue by enable the
          signaling of the base fence.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">diff --git a/drivers/gpu/drm/drm_syncobj.c
          b/drivers/gpu/drm/drm_syncobj.c<o:p></o:p></p>
        <p class="MsoNormal">index d5db818f1c76..971ad97a2f54 100644<o:p></o:p></p>
        <p class="MsoNormal">--- a/drivers/gpu/drm/drm_syncobj.c<o:p></o:p></p>
        <p class="MsoNormal">+++ b/drivers/gpu/drm/drm_syncobj.c<o:p></o:p></p>
        <p class="MsoNormal">@@ -887,6 +887,7 @@ static int
          drm_syncobj_flatten_chain(struct dma_fence **f)<o:p></o:p></p>
        <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto free_fences;<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(*f);<o:p></o:p></p>
        <p class="MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          dma_fence_enable_sw_signaling(&amp;array-&gt;base);<o:p></o:p></p>
        <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *f = array-&gt;fences[0];<o:p></o:p></p>
        <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<o:p></o:p></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------fEf0RDzyxlNQuL50ZnPlWSJZ--
