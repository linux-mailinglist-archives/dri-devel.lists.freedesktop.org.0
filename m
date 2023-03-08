Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1CE6B0E35
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9053010E649;
	Wed,  8 Mar 2023 16:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6703F10E649;
 Wed,  8 Mar 2023 16:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYj48BetZO3xfKRGcOmINdu+9RdtfOf5CI4KwZjwxhnUg37Y6C8qcQMSPWnkouajyTqa63lOgEH/1gI7GkGKbXIsXZ12RtJwBZlTc6NazFyEmWef7eB7rmyjKwy7EmDZgN/ylBP1iAHEEFMwFihzWvEjUc/3sDnxlzu0OTuyI9hOBwr+PtU5wvtr7oGrFb/jkNpWen2uPbdJz0iSzbu5yWSxhmbRR6zDw7IFSvN82t+onoT0B6un9uXCv9eU0nKCB6+DZZEMLn22fp5FoCoTqBgOferJoePvPmmTWzosAYqr14dBhglli/gvbnN8xNATBDjTsYDFlL1Otm9+PAa1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8u/UZ51vkoaXzmaw4zeTC9riWiQ3LbCTmO4HJzpBVBI=;
 b=FSG8supmBlr4byt4y4B/DHarEKirvCoqRTIsuxtK5DKUfPz5wXmbk/ch6CQQNOKwN0ArNlwqKkcnhFls9I/AOe1AnzCauxk6bTYT21P0HZSqhXBaGyThJUvjgaepB2tvCboTL3h4xBEIF/0UpG48ZZ8oPX+vpjgMAozut7jrPI0Sbs1CAi3kOU3JpW1GWD5aVkrFIXLllzfZPaiLb0S6z10I2zVh35XsqPofLUSFe7uxEu8S5ocuoJ86pXGbj04ulVu0xGS4VKCQ/5GLgEbPTNj+Tgk9TZSUb+FCBNNSitbUEjsLc8xHuoqy7NAIP14TIyLpGFDdcndbkXD6OVDIuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8u/UZ51vkoaXzmaw4zeTC9riWiQ3LbCTmO4HJzpBVBI=;
 b=iUDUM7V7/Z7n+h3uDuUvrepR3H3JQwDJW98wCNvPRlyiWd11QToCV/6u1io4HtkAMwMVBtO+WV2ouP5WWBkgh1EEyjgQCym7Lnru1QH1ilrlvxiBLmOsCbX8OoAh/Rs4BBJPUY4+6uMpCB5JM+nSSDp7T8wg2W29aoWEUH46Foo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH0PR12MB5315.namprd12.prod.outlook.com (2603:10b6:610:d6::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.31; Wed, 8 Mar 2023 16:10:09 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6156.023; Wed, 8 Mar 2023
 16:10:09 +0000
Message-ID: <ac8fed53-6f05-6ec7-9ef5-61110cd83c0b@amd.com>
Date: Wed, 8 Mar 2023 11:11:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] drm/vc4: Fix build error with undefined label
Content-Language: en-US
To: Qingqing Zhuo <qingqing.zhuo@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230308093408.239331-1-qingqing.zhuo@amd.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230308093408.239331-1-qingqing.zhuo@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::35) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH0PR12MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: 8985f453-0eb1-47c3-b023-08db1fef96d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cMij7fRNPJ/E+dEx/TqC167gojTlVfLUMUi5ufa0ZVQI54xm8xHJuCb6qz/NM010BHTTPLo84sa1i5ff75WaIHWEGaMrXdww2YOjhePGU0XwrekDRmsUC4bP7OZ1H9y3gC7uX5igDYaRQQ+RJGpjtwpuPwZ2pF7quWE31H65WhLmjM6o6mIhPlCWgKUzDi3SDq19B9DA/vAv8K8VVPQSuy58KoFxQslGoMdmDHuNuuR4It21FB7DwLzEcl3jPVDGlBEewx1nn/zNbPQHDma3QTfCzQgSRvvValebtRNyI+i9CvFMTPin6AGjS+i83CHobHq5K7z4Bc7BwOa0MuhCiEIqOvriyL9B4z352whVEC4rmJ+oFn7vEzp9xpKeNSHPVv+yyLX4tZyELjR9KP4nSQPmJJAmhAc+hWFRF+VqVqxX7NByC4qs4O6/1E9VbT4PXGwx8JlsR06GdOJUORN7qByZIfGagabRGStX5bU7vXDr/BdJWJHbjkGL9G8X/meWc0w6cGcmBhqlEVKvAMXYIbHlGHkEfYxMCGxeuKwuEkD6fPoDs/uPqyVCz5ZXwHEzMwmGkHUwKx9CEfhS1Yhcd0oME09W53mIUGE405R/AD6Ogayv86X3dChNIUjAU5M0TeVDNoMnECskTBBDdVf2FB3B9H8IS6/RNm02JSTimtviM0gv3HIZHRDQmvaQU0aUlPctDJ7DLZMy7O19219zP0AXnh6/GbLt0N9hXZURZWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199018)(36756003)(83380400001)(186003)(6666004)(6512007)(53546011)(6506007)(26005)(6486002)(8936002)(66556008)(66946007)(8676002)(86362001)(31696002)(4326008)(66476007)(2906002)(41300700001)(5660300002)(44832011)(2616005)(38100700002)(316002)(478600001)(54906003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVphWmJFajc5UlBwNEtjWWwvUU5rR3MrKytnQXYvM1VDVUhlNmYvNFVOc1RL?=
 =?utf-8?B?OXplRmJPemdmK0huV253N0NKRWVTVCswN3VMd2gweDVmUlAxWVZzVEhtcENH?=
 =?utf-8?B?d3d0U3A3dXJrczg5bGRzOUdYUjBMY0FWNGFMNTJLcXZXOEZDZjlKTzJ2cEdC?=
 =?utf-8?B?NkJVSmk3aEQ3WUx2cFVXOEhyd1N4czlzeEd3WEFIemZSa3lONU1sa2pDMWJx?=
 =?utf-8?B?NVF1aER6QlVZT2ErNmZHNkg5RzhTUjlENWRRdWtncHQvc3cwL3JVRWNBdjNR?=
 =?utf-8?B?Uk9sNmhVNS8vWVAzT3R4Zitkd0NuTnJyOVpYSXR6OTd6YWx4Y1dxQUVLT1A3?=
 =?utf-8?B?aURtN2dDVnhnR2oyVVNnNEJzSTZZb3ZqSVdYTHpBL05rTkc4eFhxQ3lRM29v?=
 =?utf-8?B?dmdzY1JIZVpkOWRlMXhsMktwOXdsZ1ZKOGdTV05IRFgvV0pyK3lTRzRrVEZV?=
 =?utf-8?B?RzhmNTB3U0RrL21wSFhZQ0ZjUXpVN25pWXMvdjJFa1J3U3RQK3JNYlNsZ0F0?=
 =?utf-8?B?QXpvWW5hYTYwUnIzb2pNRVQ0WU9oeEk2ZmhPcVkzMWNwT0ZSampTc0tkVTI3?=
 =?utf-8?B?VjNsdWM0cjl2NWt6ZHdXR3c3QUl4NUNrbDlBRkdmd3padGluc2YrMVNlb2pC?=
 =?utf-8?B?WUdTU1hyRkxqaXJ4c21zZkduZEhOMjhXeU1YQ1lTUlVZVzJ4dVNVZlY2a2xv?=
 =?utf-8?B?QkpmYW9VdHhWOENKNVNGejFQeDNjKzFZaGxDNXlXYmpzRWxnZWdkL29RQjU0?=
 =?utf-8?B?TTIxNHg2b3A0bnZHVTB5NUN1WFR4d0tPaGFqNUJWSWF5Y0tlNkRIamFnVHc3?=
 =?utf-8?B?ZnNZNG9OOUJRWnpYenljNjNCUzZQQWZsa1pWblpUMmZnQlM1SUF0amJXd3Nm?=
 =?utf-8?B?YWlHbzIrb1hTTE5EbFV1OCt2TTVNWU9PZHdIN0I3eHR4ZVZFZFA5REZuQ1dj?=
 =?utf-8?B?SU5xRmx2SFVDL1NCclM0cGJzZG9wcERsM3p2bHRNelFkL1dlc2FFZWFFdyt4?=
 =?utf-8?B?aG9nbUVxVisrNkVabVI2V1JJUHU3NzNQTlp4NTRseDQ0c0hMZDc4ZVZQODRR?=
 =?utf-8?B?QVdaZFpvRjNtN0pZRjlJenhHclZuQ2lKWmMxSVdUWlVtb0YvMVgwVUdWbloy?=
 =?utf-8?B?dEpUMFFyWG9WNFQ4cjQzQzIzMXA4SjU0N3Zlc1F0N2gwbjV1TFJZNGZYU0g4?=
 =?utf-8?B?cVpoQ2pBY2RvQTNBbmZaUVdsT0hhZDgzeEdpcmw2YnhpSHl3Zy9hZ3VBS1R4?=
 =?utf-8?B?aCtDVTcrTC92Y0xDWkt3WHZWWGM0cXdMNFdRTTN5NHBpYVJ4RnBhM0tLNDdF?=
 =?utf-8?B?WEhOQkJlaHZsc2pkUENqQktPcWRkVVVtenc5S0I1cC9CRUUxT3hnRW9wVVpZ?=
 =?utf-8?B?Q20rZVJCZEtWallFL0NYa2NxMk14SzREcVY2dW84YWl4VFVVMnNUQlNEdDZF?=
 =?utf-8?B?ZFFYdDFuMllOd2szeDloZUR1SlFMdkRyblVFbWZDbTUyWE51RDBNaERnVUNO?=
 =?utf-8?B?S05TNjVCK2dTWnZwcUpDcGtmc3BsZHlMYm1zcEZHRXNBRzIvYnZ4ZFdJemdR?=
 =?utf-8?B?MmExckYrZEZlSTQ5cDlyWnBLeW9pYi81ZU1UZFk4dE1WQnB3SG0zKzZVYndN?=
 =?utf-8?B?VlFoV3ArQW1VYWZaVVpCTEtPTTFNK0tGVUYvaW5aWTVGMGpMRERFUFFpbFhX?=
 =?utf-8?B?SkJWeU9LS2xaRWJDNm5WVUZBbFhHNTRiWG9SM05iSmtTSnBCUTNuY0YyZ092?=
 =?utf-8?B?bWxQblhuUGo1bUUzSkRNUnd4ZDBxNUV6bmhQa2xBL3dwNUc5c1I5aFNKN1lk?=
 =?utf-8?B?YzIvcjBqLytBbmZGV3F6WFQxeldPRFlURHRHWUFvNUNVZ1BkRitOWkxlWGxm?=
 =?utf-8?B?T3cxLzJ0cDNGZy9zRG42YmYxeU9nay83OWF1SlVCcmZsOVY4MnRRclhDcENJ?=
 =?utf-8?B?ZWpsdHJGVHNabUNUR2lzYU1NRXZlKzFwaURTWnVEY1lkYVB6V0g2UEY4Qzkx?=
 =?utf-8?B?QncvYVQ4QzBidW5uSEQzVW00N3pQMTZNMHFvTWtSbVV5MmU4akVscnVXeEhE?=
 =?utf-8?B?TndNeVU4MjIvc0RPY0xodG51MUhBVldqV0o5ZjBDOWRDcEFlNHdiZk5rUHYv?=
 =?utf-8?Q?M4Yw67CmqruOiZU8LagBCgZRh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8985f453-0eb1-47c3-b023-08db1fef96d5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 16:10:09.3788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCju49JkSUFON+Mxqi6zWp0VZUpYWBmVGVnSLYHpmPVFhfZ1RcNZxOSPOEY/NcLbLn/wjmk37RXMhGATUc7Ayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5315
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
Cc: Emma Anholt <emma@anholt.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ vc4 maintainers

On 3/8/23 04:34, Qingqing Zhuo wrote:
> [Why]
> drivers/gpu/drm/vc4/vc4_hdmi.c: In function ‘vc4_hdmi_bind’:
> drivers/gpu/drm/vc4/vc4_hdmi.c:3448:17: error: label ‘err_disable_runtime_pm’ used but not defined
> 
> [How]
> update err_disable_runtime_pm to err_put_runtime_pm.
> 
> Signed-off-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 9e145690c480..edf882360d24 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -3445,7 +3445,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>   	 */
>   	ret = pm_runtime_resume_and_get(dev);
>   	if (ret)
> -		goto err_disable_runtime_pm;
> +		goto err_put_runtime_pm;
>   
>   	if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
>   	     of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1")) &&

-- 
Hamza

