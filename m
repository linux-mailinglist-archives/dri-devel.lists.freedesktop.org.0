Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429E58A543E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 16:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E063B112621;
	Mon, 15 Apr 2024 14:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HLz0qcfd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BEB112620
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 14:35:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbvB9NtsKJXTTZ2qtRTpU3Eoq0OVqX20IQ4f6kYoOsh5UohbvwV9xlBXq7uMNnEikU4bsZcEQ0jWyvA+5hDGKFVRZEvdam6CRsuhW/0uFzSaWJAkEVL24L0/ij0BYlXN9Ymq5KdE24u8DCqOfc7pLjNFVcbqPuBqEnSr3KQBztpMFth4rXuJ1RlX1Fb0NAx3lgm8d5r+MFQ+WXyK97C7aN3KaGdsMMwuSrdutcIcARZukyye0l/AlhKfY+TmiDmQat3zfPTr1vE/L64T5nuNeQBEKcR3ziVIarWMhhMGcRXR1miDBFyd3BNlzwTpldlz33JutUs5WKhrpYupkjhsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjEpVLiwc54Dbn2fC+VAzB4nRZ7BqeAEjSZYK5mG4uI=;
 b=CcftXOpqUzuQ8iDZHwEqYtc0Xfb/xFjcFv/ivYOYRz1rghuzZ3p+575YrH4FdfORLGiok+SWfWRVJEHjBFz0YuKBb4I39vbFbk4eqtuAlb00ESgI3Nu5Xw3mWW3ebk5K8rQQCOWnc0xEzjzgKFb+C+EsPRKlM845K9D3ZdAUaKIIxK1p6lwJVbjIBw9HmT2aRC/riEoojT3f3OpPgcTjhFcfR1eVy/bg1Jd+j4VbE1B3ePkInBVywenFeTYIUno0HsbwCvynK1gKR+mMEM/eHpIYRc142mkv0atPURJD+9gxzL17wG7rvj9/S2heOTjEUlC+1FRJT7TqrXM9XcW+sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjEpVLiwc54Dbn2fC+VAzB4nRZ7BqeAEjSZYK5mG4uI=;
 b=HLz0qcfdyqXdimhrDT2wPt1VICn2BYtWuath5mroqnwYuAY/M2cKaQVKjqRbIXa4Dw4uFNx+ungpINZb5ghcvpAylpbE8grvWozWXiQ7Vdblv+fy2ZgQ3XChq/8284W7RMfshEcByZtun12HS99ZahEY/bJzupBHzZwoqFxKqBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8791.namprd12.prod.outlook.com (2603:10b6:806:32a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 14:35:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 14:35:12 +0000
Message-ID: <cba06e6f-06cb-4b0e-88df-d25d278fb4f2@amd.com>
Date: Mon, 15 Apr 2024 16:35:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc: dma-buf: fix grammar typo
To: Baruch Siach <baruch@tkos.co.il>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <d242a446258e34b2db8990561e51f145df748f83.1713100057.git.baruch@tkos.co.il>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d242a446258e34b2db8990561e51f145df748f83.1713100057.git.baruch@tkos.co.il>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: e6134feb-b3c8-495a-d2d6-08dc5d5941e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TmUO5Ui4lSzIZBYVD6TJtL/9E86ARDq+oI7+yMhXjSRi7gHFzYpR4fD9Dq3NebTctyP/4Y0KznhXiJt45mVQtFimM/uh0gVLOknB8SEnE7xFYH+2roI+h1aIDeZNnLJMQiz0omjElImETDr41/Ga8wxnFl6JFE3q4ZMFu330F6XnvbQAWZfapVW5tXK6WJudGGOu5Rjh1/malRav567hgwN5qnB9Ysh8/KQmNtoHWANqKQ1N4ZJ6xKK2z+rywzI1zDJrJ1T+ufipwkmJDovTLw7Cu4lPnVkuWENy2pOc5Y7gCGJoIbITMrsCnpj3YyC8q77hV7ZYZZ7PaSi8P/Mwj25WwD9al608fLPq/v+XC0JCi8xw+hvAcvhlNwC9WzkjwY9eQggoJqtR74+zRJQJdwZI8UljDhxQlE/gapyKx+Hyk/ueOcIgUXg+aXLxyfo7MtrqTGNrz/CpcYuQm7PC1snbi0K0ldnBqVEejb7ea6otZhoZwoxCq5mCUkHHB2k2ppiqmJxK1hbUXX70PwhY4+Q7e1I10/131giNrKmvTBEO1YhrttUzplYiTgoJ9k6RF1gB6bb8qi0tI8DIXOGxG90JPiVSgs5oF6GJS0e1ZDLDz44kQoPgokx78zz11M41ti7Kpkjxh27BdY86uRqvHQVpMoS3JVW1o85clG1Mezg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm1RcDQ2VTRVLzBrRW0rcyszVXJwcTZvSkhYYjlhWElCSllONXNZcWw3VFh0?=
 =?utf-8?B?cS9BRWNLUTYveVpxUlBZSHlkTUcwNG5CQ3VPWjZDUm5WZC9GNGxVckdBdTlq?=
 =?utf-8?B?U2twZVlENTJncUsyZjdFYVRWVFhLbFlzaDNDdUJYOUxlaHVqcklEREZUbGpZ?=
 =?utf-8?B?a1p4aml2TjExVklNajNEeis2ZWtxYW9xZ1h2b2RQVTFDMnNOODVhKzViNFB2?=
 =?utf-8?B?VzlYNW8zaSttcUU2TmNPNmIrejk5Wmx2RHp5TEI3Z04xNmwwVmtLbVA0bmdl?=
 =?utf-8?B?SnVQMnZmUmVWZnIzZW9JcVNHUEFjbWxiMVNMSE53ZmRnUTRsMHl1STNxOE0w?=
 =?utf-8?B?TlNKN1VSazZtMmNEZndjSDNNRVdJSG9uMHU3VVEvNWYwVUFLa0xwbld6WVNF?=
 =?utf-8?B?eWJSbUY3NlMyMDlRN0FkR0RIY1B0bUtNQ2VxcHF4SFA5RWpLQ1FUUmljblhK?=
 =?utf-8?B?YVRBY0wvWUlHREtNejIxc1BVYXJVclBia3J4Z09ubVdlRk1ndmtKRitNSlZD?=
 =?utf-8?B?RkZVYzNXTjZwb2NGYWsxVGRpZFBXWk5mNjFjNVRlVDZCTk5DUzlaeG56RWw0?=
 =?utf-8?B?Q2NtbWVSSTdLVkVYSlRNbSthbnd6eUlKNmtJazA1MWZBNkdBMEJnZDB1Z2NO?=
 =?utf-8?B?d0ZoVlBxMU5ncEJyRmkwcjBNRmdqa09hRTFFSTVoV2pvYUxXRVZVQ3NNdkFu?=
 =?utf-8?B?QzBySHBVZVdJM3pja2NDcndBMG56TUVLRERiMTNQc0Q1SkxQVGlzVmw2bW5t?=
 =?utf-8?B?UENWMCtSbWhDY0luaUMvQTdaVFY4bmVHSGFDYVJ0VnVqZjB6dE1rLzJiNWFj?=
 =?utf-8?B?V3hQSXJQMlFDUzQ1UW5pMUw5T2JEcDV2MXZsdzEzeFFCcm5acnEyQmVPemkr?=
 =?utf-8?B?ZU1WUXAxTmFYSE43TXpsSVhoZ01OeFFXZzR0bmV2SlRXN0NrRS9KSndIaGVO?=
 =?utf-8?B?NUFvbm5QdUV0bk5pVFlveVhqZFZvK3VIemtVb2FlNVRhOVFWSFlkYU1BL25r?=
 =?utf-8?B?Q1J2ckt0SnZiZEVnRTZERGNCOEJudlNHNXhSbTVMdkRsZ29ET1F0SzJnNzdi?=
 =?utf-8?B?VVFKVmc3dlVTSVphZ1VtS1Ryc0ZvWFdIb0ZmaXRFY25ISUhxL1k0dGhwU093?=
 =?utf-8?B?eWdmVGM5dUMrSjdOVmZ4dHhOS2V4ZHpyN0dmRDdOblFOb2UvVmtqb1lKWnpJ?=
 =?utf-8?B?ZWJJOHJDWW9mZVhTdmZLa2ZjQ2Q2QStxZkZFbkxnVkZ0dEVOOFpFTzExUXJW?=
 =?utf-8?B?Sm1qYlMzdlVnSlZ3WVFuUTZHQUJOZUduNG15K2RaZGk1N0VvNnpqMGlwRmti?=
 =?utf-8?B?OUEzbERpaTQ5eStmUlZFUGE2dUdoNTVUYVpVajVNWW0wYVZWWS9xb1lZVmJt?=
 =?utf-8?B?ZitvMTZVSnVQVlFXSHI3bzZnNDZ2MFVHazVreW1LQWFtSjV6Z0VCN3hkZzhq?=
 =?utf-8?B?OXFGQXRDNFVnWmtTeEllMDF2anB3UlJPZDU3Z3M4cFJBSFRkenN6NUQ4U1pv?=
 =?utf-8?B?bEdOUHRWSSs0OUtUcEY0NVhidUF3ekJxQVAremxkcmJnYURINTBsSjZjVjF6?=
 =?utf-8?B?dXFNa2hNV2Exdi9ieXQ0MVNuNGZHS2pwYWpyRDN4SlorQzFKbnE3VHFTRnNO?=
 =?utf-8?B?Q2puWVRNc3dhN2xLTkVkOVFGb0tiRzltQUlRQjh0Uk1IN1NFSE5YRXREbjVj?=
 =?utf-8?B?engyV0kxNUhaV1hjZWRzR1FZaTlObHV4ODd4T0F2Y0dTWUFQMzlpQ0V0eUFi?=
 =?utf-8?B?MXQ2M3ZMYVJmb28venM0cjhvYjhCdUMrYW1YY1U5a1hFbURsVTRpczZ2Qndl?=
 =?utf-8?B?bHFLY2FtQ29IMWRNZnBady9Kc3dTQmFmeFJjRWRzWURJdzZHNjR6dWxpMkpW?=
 =?utf-8?B?Nzk0VEZUZFpIYXlDVGp4eFdwblJVaEh2dGN3M214by9FWGNEUlRGckZ5dnhD?=
 =?utf-8?B?amQzSS9FVk03emdXS3hzczg5K1UrNGhjZExlZTZ1eXIrMExjNUtkYWZ5d0Fn?=
 =?utf-8?B?RXBKZmVSU0E0WEk1YVNFN3l1U3FRUWNNYlZHYWtYbW5YTHpzVHdwZTJReHJu?=
 =?utf-8?B?WnRzZFY0MHN1Q00wSU93TUp0U0lxRTRXSTV4bXd5K2QrYUxrZXpBczhjQ2x4?=
 =?utf-8?Q?ML3PZq6VLTjBRvWoGlE2rXc5W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6134feb-b3c8-495a-d2d6-08dc5d5941e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 14:35:12.1859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGPRp13+JwLKQxgOwOBigCaNiJ71oMANLWyfA0IZbbbxwnrJi7Rc7iW+ayt3gbpX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8791
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

Am 14.04.24 um 15:07 schrieb Baruch Siach:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>   Documentation/driver-api/dma-buf.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index 0c153d79ccc4..29abf1eebf9f 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -77,7 +77,7 @@ consider though:
>     the usual size discover pattern size = SEEK_END(0); SEEK_SET(0). Every other
>     llseek operation will report -EINVAL.
>   
> -  If llseek on dma-buf FDs isn't support the kernel will report -ESPIPE for all
> +  If llseek on dma-buf FDs isn't supported the kernel will report -ESPIPE for all

Looks valid of hand, but checkpatch.pl complains about 2 errors (missing 
commit message for example) and a warning.

Please fix and resend.

Thanks,
Christian.

>     cases. Userspace can use this to detect support for discovering the dma-buf
>     size using llseek.
>   

