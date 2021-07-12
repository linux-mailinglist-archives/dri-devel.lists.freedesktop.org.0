Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED53C639F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 21:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075A189128;
	Mon, 12 Jul 2021 19:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E4C89128
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 19:22:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEw/PWZpEmv8MWYmbeMkz2/01AeeMJ1AqgGwE1e8W8tLJQbuESLs8E8YQZXRLKdzQSP2WQZCVmEORJpkBNkSjMuMucdJ5lfjMJjlBHKizyZH1EbOm86a5OECxEhnth+3CrqL2WMEE37UH7zafBNTZGG+gr8JUKi9XkjyW+YWkK9Ea/ZrxOl5f3/1vG8tVFn1fdDvQ5fHHNm4+rlcbDztB83U95pbEvFIT88jwf1EjYLMnMrGoEe0yc1njEi9ZtmCm7oTdhx0VIfcHIjfH4Mj7GI9Bat9PhQshz6yNBz0LLqxd7D2uGgKdsMn+P876IBcjgga1M8pUZZsaJ//fAOalQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asPCJzgkKu/9wxUJ/13mWAPVbr/Pw66Z3agtFMLtVMA=;
 b=MM5uOegGmsbnLXLprH3Z5VEGvlTOC/4jD34Fe8dChaVNAT/PtxWmCDjOYmbUc+0oWryPiSk/YR+7vmV3w4qT+V40p3BZnQYUVqAe5TvrqOeCHV8TXlQO3TPJ/t5tC/aldiD0SpFGNHQTJwSGjpUWHLWwniBG8oza66nHjl0TW4OAGtiMzuC2bOE6Uh95jba0DlJ/mO2V2xYO8VSKyxl830WZcksaANnOkqfxAILLt+/keXcmtZPa2nmqxhymVIz/PjOC5MhFzuLxvjmegtMQwyKNCDnYJ0hDxvDsw7iKQhPfYtItDqR6cpe1zqTAV7pqBnk7oyfpffjR6xc8UF3N1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asPCJzgkKu/9wxUJ/13mWAPVbr/Pw66Z3agtFMLtVMA=;
 b=INkmvxGRGZu1r5ioMgfL70RNhc5k0k6VYM+zumVXZGgYa9e6HondjYmaT42BkeYSbnUqCkN67/ApHZBxjgy4bMAM1mm7enGTlWtiRK34t8rMAg2FKnn6NO6FgM/zr8yv7UGhk8rvg9ZSfVWp1a8nzmtxzFcz0QrLrtROqgQ8Gh8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB2888.namprd12.prod.outlook.com (2603:10b6:a03:137::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Mon, 12 Jul
 2021 19:22:46 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::6c58:1598:e768:d45e]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::6c58:1598:e768:d45e%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 19:22:46 +0000
Subject: Re: Linux 5.14-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Jon Masters <jcm@jonmasters.org>, Matthew Auld <matthew.auld@intel.com>
References: <CAHk-=wjB5XBk4obhMPfrU3mnOakV9VgHAYOo-ZGJnB2X0DnBWA@mail.gmail.com>
 <a9473821-1d53-0037-7590-aeaf8e85e72a@jonmasters.org>
 <CAHk-=wh0mRAyL9GNVjhw2ki7vRevvUnovCzawn2FO7e_dOfU-w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <51160271-197b-035f-34f6-22de5468d5b9@amd.com>
Date: Mon, 12 Jul 2021 21:22:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAHk-=wh0mRAyL9GNVjhw2ki7vRevvUnovCzawn2FO7e_dOfU-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P192CA0019.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::24) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9a74:3842:64f3:2954]
 (2a02:908:1252:fb60:9a74:3842:64f3:2954) by
 PR3P192CA0019.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.24 via Frontend Transport; Mon, 12 Jul 2021 19:22:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b31019ff-82dd-445d-c725-08d9456a6dc4
X-MS-TrafficTypeDiagnostic: BYAPR12MB2888:
X-Microsoft-Antispam-PRVS: <BYAPR12MB288814FCD41995F7118F27B583159@BYAPR12MB2888.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q8zxuRjY+iigiyn92CibYaMbt1CsWsOjcNJgL1Ob9N7P2adgWW8rPXMCUwdn7jbaNVLo/eDgAln6DAIX7glCs1dUsXcDxa80uu1pNngkbW3BjitMEhvbu0PNqQCpb9+yl5VDYEbzm2jeAFB5il836SUkYVNpRqXSEsnIpowGKZBZYTLoqEPg5w1V+6a7ubWaGOB3mgLKtAZyDitUIEAbh/ClwEOrZDy4Skix09EIY8CzfHWW4bneURm5BK2Cf3UOMPchMV+qGyQJS5JpXHbUNTRpEWardECRQCogPVTIOLo/a+gS497DUeX2fHC9RXt74+0bl+h0CAYZJfahq42pAhvUjt0jyjRUZKfmK+Yb5kEGGuE5ODJf+gLNR0Wa9OOdrOunEI98Mz1Op6VdfIGieHQLljP8wfSmXNzDIAzmM362IEsIQsf305G2ZXDUvqjnJRxQRZanxrSSa+0h+weBr38q/5AaMIAJHNPgKCwqWUzf71zyhXKcBCJm/6hP+/hJMep2yJk/3eOUtyOwpiQMS2kNwGnm/0B32X4dbTgwdADh88VPbtjESfLzjeeNTfL1hYfcVvqPBhijwunqrP6ojg3Jgn2RjSPXsUYfjrtYA7P22dcn6hj99/otwPwE/vUv8RcFZSYyM+y2cdafss1K/D6axOznKGYDFl35KVTBgcsV8W5nYL13FBD4fNragPVxbPpfW2Sm5wFhugoOpIAV1qFIvQMhEjjb89sLgUxNI+LTNY1LixXyEbNIjtaLTmNw37xSGMfQov327R0C2dN7G97rcAU19r92xW2tUDNTZueRrKxJelz/IjSH+NWnmstI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(86362001)(36756003)(2906002)(6666004)(186003)(66946007)(66476007)(110136005)(966005)(83380400001)(2616005)(66556008)(53546011)(31686004)(5660300002)(8676002)(6486002)(54906003)(31696002)(66574015)(478600001)(316002)(4326008)(38100700002)(8936002)(45080400002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2NjMGtLQldZSXcrTm1IREI2OHpob0kySFYyNW5XaWpYeXB4a0p5QWNKQVFG?=
 =?utf-8?B?Umh3WW41ZkR1R3ZscHVmQnB2T1AzREt0Z2JBdU9uUkRLWEM3NGpZY1FUQXY2?=
 =?utf-8?B?WHcyOGRQMWRYMkFWcmVPM09IUGpRU2dpelV4RU8wZERURUZRUTR6VEFQUzFE?=
 =?utf-8?B?ZTJFc1dhMlVBdnJDME9INEFLc1lxb3dwN3JvbXJINDBnN2ozcExRa0ZZZ3lT?=
 =?utf-8?B?N216QVAvdkFTdG9yekkxMlV2K1RMMzVFZVRlQ0dBQkFZU04zU29FMUdEb2dY?=
 =?utf-8?B?eHJhemxkQTNqUENZVW90SGd0QWFEMVNnZkhDVC9QK3lKUTJUU0ZhQTF2L1d2?=
 =?utf-8?B?elVlb2c4SU5TTDJtaENrWjNIMDBJNHlyZWgzeW1GZ0dOWmg3SnVxS29qbGx0?=
 =?utf-8?B?NjZTTzVlNDMvNjEyZ0xQRG5DQURmWmNKU0pXSDlwVHZnMk5YVHVyRFlDSmRW?=
 =?utf-8?B?ZEhiTUFNL0hXdUJmL0ppUTdEWkFtT0FOM2hiZ3V4TmN4aVJXZXJBaXM0TnJ1?=
 =?utf-8?B?aXhjSjhXbFZXcDJieG1oZlAwTE1WSGI5UlJwbXVubGZqT0xHV3FmQkFrRlo1?=
 =?utf-8?B?VU5xRXhkWnVOQkYxZkdpL0dNdHNzL1ljVzBLUnc4bVNRdlg4eWRnVWxVRGNv?=
 =?utf-8?B?YmRreTNKRGdmbHgrTlN2R3h0QVQ1N3lvL2w0ZmZvaG9TZE1Vb25XLzN2dWlQ?=
 =?utf-8?B?R2pTWjJyakRyUi96Nm5xUWFEa1Rld0FxQXZTR2RHS2lNM0VwT3JPS0E2dGRY?=
 =?utf-8?B?V0JIeFRZekNqT0trd1lyeGlvR1E4TXp5STd1aDR0c1VwcS8rZmI4VDN3bWRX?=
 =?utf-8?B?a2hWT0thMTBLcGhIblVNODBBNHgwRG9NM2V2cFpBaE5XRmZWOEtwZU1memRU?=
 =?utf-8?B?RFE3U0hVNENnalFiT1AxdHVpbzJJS3NTdmUyRC82Yi9uZ253Vk0xT0RrR0JT?=
 =?utf-8?B?a1ZqR2lzWnUvRFVFZXQ0cXp4QW1ydERWbkM5eHF0MHlqczBPT21pY3lGcG9E?=
 =?utf-8?B?UE5xL3l0bG1QYlJNVVl4WFF6UjdMbTg2WE9ablJjSm1teENzTy9jeUF2SEVR?=
 =?utf-8?B?Q0d2bkQrcE5FaWF1aWxlZnZzMUUreU9NcFdTaXdaSm5vV2o1WU5ZVytDOHZG?=
 =?utf-8?B?L1JYZ3h5cTVxQko2V1N4TG1ndTUydjl5a1o2S290dGsyOVRxM29jWkRpNmF4?=
 =?utf-8?B?WnQrN20vS045QWlVbkNqbUNCQ2pFU01rRFB0LzdPZlJXUkFqb3pUenpUNENT?=
 =?utf-8?B?L1N6Q2pENndKbWd2K2RreHJRVVFlWkJsQVVLZmpkczI0d3BIR0d4ZmVRUDJo?=
 =?utf-8?B?QXNWYm02Vk5mZUVVcEVWNTR3bjl5TXJIOWtoZHc5LzFEV3VkT1hmS2ZMcUdy?=
 =?utf-8?B?YTNmQlRjM2RmZzBlZXExKzBNUlpaS1V4SXB4Q2tSR2hvY0lIZ003N2k5QzFT?=
 =?utf-8?B?SnhXZUhHUFJQM1FBai9sN0QwWmdISFZkZkQvbExOczdocG9heU45bWlIejBP?=
 =?utf-8?B?L3NjWFpnM3RKT3RydlM0Snc5WWNzWFp1NWh4UTRMaC9Dai93clQ5bzBzNXcx?=
 =?utf-8?B?djN0QU92R2NzNmJ5WmRKaHhXV2loNW5jczQ2dElaTHBwZXZUZ3c3amxsbisw?=
 =?utf-8?B?WTNuSlhwZEhsSXFrenR4YXhLMmlLdWVKNkpCaWZkNTdzd2RtT1AyL0xyeW82?=
 =?utf-8?B?N28vKyt2U1VEZ3JsdmZWMXBSaW1pcEVWTjRudEM3OXF3MGlrbEhBRllMQkQ0?=
 =?utf-8?B?S08zQlhqUnkvMjRXTFcvS1FXcmV0UXo0RlVocE5WYSs5NllrVlZZNWw4YjUr?=
 =?utf-8?B?TVFWM2plOG5IREJZTG16eWJZdFhzSElIQkJGVEJDV0FrR2hwdktZNE9saVhx?=
 =?utf-8?Q?QDSC8fKOJzASs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31019ff-82dd-445d-c725-08d9456a6dc4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 19:22:46.4165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3/pw6UVOiMIWa0Jj/icY4ZrmbYOs1E0SK5W9qAnZgSlLvcyt6sCjSdQbP5abEK1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2888
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

Am 12.07.21 um 21:14 schrieb Linus Torvalds:
> On Mon, Jul 12, 2021 at 12:08 AM Jon Masters <jcm@jonmasters.org> wrote:
>> I happened to be installing a Fedora 34 (x86) VM for something and did a
>> test kernel compile that hung on boot. Setting up a serial console I get
>> the below backtrace from ttm but I have not had chance to look at it.
> It's a NULL pointer in qxl_bo_delete_mem_notify(), with the code
> disassembling to
>
>    16: 55                    push   %rbp
>    17: 48 89 fd              mov    %rdi,%rbp
>    1a: e8 a2 02 00 00        callq  0x2c1
>    1f: 84 c0                test   %al,%al
>    21: 74 0d                je     0x30
>    23: 48 8b 85 68 01 00 00 mov    0x168(%rbp),%rax
>    2a:* 83 78 10 03          cmpl   $0x3,0x10(%rax) <-- trapping instruction
>    2e: 74 02                je     0x32
>    30: 5d                    pop    %rbp
>    31: c3                    retq
>
> and that "cmpl $3" looks exactly like that
>
>          if (bo->resource->mem_type == TTM_PL_PRIV
>
> and the bug is almost certainly from commit d3116756a710 ("drm/ttm:
> rename bo->mem and make it a pointer"), which did
>
> -       if (bo->mem.mem_type == TTM_PL_PRIV ...
> +       if (bo->resource->mem_type == TTM_PL_PRIV ...
>
> and claimed "No functional change".
>
> But clearly the "bo->resource" pointer is NULL.
>
> Added guilty parties and dri-devel mailing list.
>
> Christian? Full report at
>
>     https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2Fa9473821-1d53-0037-7590-aeaf8e85e72a%40jonmasters.org%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C06dd885408e84008a9a208d945694d9f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637617140858341274%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=UlqsiWTjfJZ4%2FeIJJMh1AeCqs5SeFjNG%2F22UiuVAIII%3D&amp;reserved=0
>
> but there's not a whole lot else there that is interesting except for
> the call trace:
>
>    ttm_bo_cleanup_memtype_use+0x22/0x60 [ttm]
>    ttm_bo_release+0x1a1/0x300 [ttm]
>    ttm_bo_delayed_delete+0x1be/0x220 [ttm]
>    ttm_device_delayed_workqueue+0x18/0x40 [ttm]
>    process_one_work+0x1ec/0x390
>    worker_thread+0x53/0x3e0
>
> so it's presumably the cleanup phase and perhaps "bo->resource" has
> been deallocated and cleared?

That's a known issue. Fixed by:

commit 3efe180d5105d367ae1dfadb97892ab93a89a783
Author: Christian König <christian.koenig@amd.com>
Date:   Tue Jul 6 08:51:25 2021 +0200

     drm/qxl: add NULL check for bo->resource

     When allocations fails that can be NULL now.

Previously the structure was embedded into the buffer object and when 
allocation failed (or never happened in a temporary buffer) the 
structure was just zeroed.

Going to double check tomorrow why that hasn't showed up in your tree yet.

Christian.


>
>                    Linus

