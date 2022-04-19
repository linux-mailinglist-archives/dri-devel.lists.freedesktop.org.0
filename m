Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94627506FC3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43E410EF45;
	Tue, 19 Apr 2022 14:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDEF10EF45
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:07:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvm02jCGiBWoMXiNsoPiEl0HOdFaw7bCl4XWTBFCyknZu496l8cXJXVu6RpkwJLrY1vOna5CGRJDDYTr6xVFvUZfsr0hX7tb+YH+o2eLQFJP0LSSnyQTiq5WD79FDt9UtqMiGWwSa0WvkCeiaBsbHYfzfBjy5hDe4NLGU9l1QIz8vDs8tCAAncENbHCJG2gx6bJhb/2TjdPyDcckJzCSYH6YDWU2Q9CWcGwjptUCubYH7pn93KvaiZQxAB9j1yv8fPAvIt3rGqUtVGerEt/1thGUBjSCHFL4p9evfeaH1rs/KOdi7FScdtV3Nm3zt1dR2XGMOVcxznkIH3Nv4VXWMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BnXtaO/qFovLvSMJhUJ2hoYS8USkfJ/TgVJsmJH0gY=;
 b=j9Q7e2N4fJZ/lzXHqo//vHp5BKqty0Op9y9LMZ2HoYPAyDKQG1G8qrHAdZjVt/NefKjlIGdx7SMn6L0Onl/fUbofrSAFk9r+0o4p7jFtIzDiJ2R6jUI6qiQRzwXxbti0Zstj3aDaCh8thO4ngspFJzNmUFgJVFh22udzGHDhbQiqCtuRKCXy+fdfVkb9ohC6fnKoluYDYcbNOhcDBh6OW457RQbs4fZ6N34M3vLnebRtBxXrcq9sb6UcwM7QE30fdwZXLoEInzQ7Q7j9gopyHswOwfOtqiyOW3Lv+r8oWjbDEySNp7L1ZWYE0Wr+KLEnugyeSfIX8zJa9ESc92kNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BnXtaO/qFovLvSMJhUJ2hoYS8USkfJ/TgVJsmJH0gY=;
 b=HJ2PZRR9xRnYXusFt9/OUhOWu20Mo++q6XphM61klbBeaVI1sTARWoMukfzlSvdhi/5/elIJ0ly1WPybXBgi6yLQpzFTI8tXSH424cj4D4AkTwH04T6nYHbkD35ACjCXDUXscKCnWpDC0oBVVEhzcetHy+Tz2K+M4jlLnVnQRqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR1201MB0017.namprd12.prod.outlook.com (2603:10b6:405:53::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 14:07:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 14:07:51 +0000
Message-ID: <20bac605-97e6-e5cd-c4e4-83a8121645d8@amd.com>
Date: Tue, 19 Apr 2022 16:07:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
Content-Language: en-US
To: Cai Huoqing <cai.huoqing@linux.dev>
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
 <20220419135908.39606-3-cai.huoqing@linux.dev>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220419135908.39606-3-cai.huoqing@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7533b2ae-cfce-453c-f919-08da220dfd94
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0017:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB001775B523DB70AFDAB0CFCA83F29@BN6PR1201MB0017.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t8KdAe21chIfNO615DErUkN/yUCvLhBYMrDYXgpiJwHlAqZIY0JoeMEtBYkYAuB8HGo6XLc3eVjOQO/OIi6mrc22SBpddkToeA8a1Oqiu0nQ8PoCk/RfImNRtKQRv5UbrJU4EgByP/mS7xSTfKjkp5U/j4eWIVerGBkUCgMJScE4RlFMeoAGd8axJP8G3oJRx0wUk4+vSFhFXHkeUbLwfUB5orLSGWGLiYopYE/6BKUb0Fgo2l8ZdeucU6rDJ1Wwv5LfJg/MYuEsVnVmx1kGL/89/pmG0kTPurjlz25PCHguJX33Xk70ECJB4ayWDIbkgA+hJ5IaAfASQyWMLdGol3E6RBaNzN7I1oncOAmadxJgzQGBH2VDVv9hRHKrWYEjms2XF/T06PWxdezdLOKBn5fhuKdwmb2Yy0Xl8w1Q17GsSkSKcZGqKcloLQIvBcQybBDJukvyEwPNNu00I/URlkiBaq+3Dz28nEMTHSFlVXuiU38EJNeA+ou6Hfeb7fKk52hLltjWOg0AdQnyfM5px+43LCagx8RytBYBJkydLVl9+cZCWF7DlyNUy2CNuvdJHA5qXXfyiZVwdrvCKLWdT2U//bjCdnSUkVEeqCdKhDZzKUILuDoHSnYgQl0HBvdl418faFhoOu0fSsl9H541RJmwLcr36n/Ggf9+kdL0gp9+HLmEb7W67te+ppQZp3RUAMrSaah6vttFN6oo52OPzxazcdzKl10AHSvtVJ5tgGgUBbWzb2dV6WNXyp9QlJaA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(66476007)(86362001)(66556008)(66946007)(31686004)(7416002)(8936002)(508600001)(4744005)(316002)(8676002)(54906003)(31696002)(4326008)(5660300002)(6486002)(36756003)(2906002)(186003)(2616005)(38100700002)(6512007)(6506007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVFFZHBsODAxQUJrZmZYb21CTCtZV0pUOEI4YlJTaXQwUm9wNkxjN0JSYjVM?=
 =?utf-8?B?YUtxekQvS1dQVTZGcWozYzhNeHpMclRRRVBUWG14VjRpTkJ6UmdpVjIzN1hz?=
 =?utf-8?B?bmZWRXJ1dDgvWDlkNHdMMlZ6RTUrUS9NNVJ4SDRsT0hJYnp4QWZ1K1dreGNF?=
 =?utf-8?B?eUI1QklDM21obXQzTmwrazRtMm92R2ozRkNQeitWYUo5djFPRXQxdDE0ZERG?=
 =?utf-8?B?T1N2QVlNME5ORXVsSmY4UWRtZ21BNkh4aEc5ODM4bk9jc0I4ZDRRb05vSFlH?=
 =?utf-8?B?S1ByaU1jWGk0enJBeGRnR2tGT2JUMWRPaUdJaWFNRGtCcTRMTkIvVGcvWjM4?=
 =?utf-8?B?d0ZLaWI2amVHamhCR21FT3ppYTlsSWk3Y1RBUHpLZk9DZlh4ZGczYVo4bk5B?=
 =?utf-8?B?aEFxdEF1MGVJZHh0SnFQNjF1c3hlVlFRQUY2MFdXbVlhVVFwVnlCOHZ2WGx1?=
 =?utf-8?B?VmNLM0ptTGs1MEpLUHJXQ3E5QUtHQStKYkFvUWJoUEtQODEyRGRQQmlxemFx?=
 =?utf-8?B?R2NweUovNzY0UlJGdTJVdkFSV1NXeVRQOVVHS0pXS3RQcWY1Mzh1Y25YR0tL?=
 =?utf-8?B?eGR1RTQ1RWpOQi9yTVZMWWpWVDZKQjl4VC9vTTdEU25kZDNmS1phcGlrd2RS?=
 =?utf-8?B?OUdxTXJlcDUya3BSSXRvbk1JNkErdHEwWW0vaHdFQ2UwNHNSVHdpZzdNVENz?=
 =?utf-8?B?MjE3QjBqUWhDN2ZmclJMREx0WWlpVzBsbjMvSDJkZkpyK0VpUFEzR0pmdGJn?=
 =?utf-8?B?TGo3bVV1VDFlZ25PNm5zclh6K1RBZGh5WmNhVklMKzNtM3VNZTdYUkxxaTA3?=
 =?utf-8?B?d1hDS3VjdWdLUXYrSnJxMXZtTVU0VlZEaEdyTWtnNC9UQVhUcFpXY2NucDR5?=
 =?utf-8?B?bnlkdkFHVjRIeFB2VzFFeEh3L2JoWWl6N0NMaVgxRFlkNDlNN3FVWlJMQ01v?=
 =?utf-8?B?WHdOd1BUQk9zZWYzSVlhTXlVSTBDM1F6QjM1QUNMUEdVRDBhMXl6K1NXbitq?=
 =?utf-8?B?VFpuVnh2dkNucjREYzAvUUZuL1NEbUdEcnM4YUlMQ2c0WC96VURYVlJJSWN0?=
 =?utf-8?B?UkM4NkZ4TGhqYzd3blBySmtaYWtUeDFFUnFpbWZuekFyeUczT09CSlJUaU1p?=
 =?utf-8?B?TWd4aEd1MzVaNVByemlUenQrOVdLaWdyM3ZqaHZuRC9RNTZLb1NKa0xLYTRn?=
 =?utf-8?B?RHEyMlR0MTFXZ3FFT0x1OFZJbHdqVVB1RGlzanUzUFFmSFZYckNiTldoYzlh?=
 =?utf-8?B?VUNSSU5IQWV2T0dxaDROTmhrS3JHbWsyNXlNY3lpT1libHFKV2h3Mmx4WExi?=
 =?utf-8?B?WXk4WWFzMTBDMGswQ05jeU5qemhUcG5ISFZKempNS09NMlpJa3M1b3doNllH?=
 =?utf-8?B?UjFmdlVXV3B6RW0vY1NTR01Rd0tlYWVhSG9mZm12N2d1T0xlb0t5ZVFudFNN?=
 =?utf-8?B?dDJhcTdsUlhtVVhqRVFJRHJ0Q20wQW9lcVYxUG1nc21HNmRGc3o5Q0VEU0N6?=
 =?utf-8?B?anJZTlc5RzFDNXJmdEFnd3ZFTmdjaXRuMDR0am51UmFINnRFbmNsZnA2ZWhT?=
 =?utf-8?B?aWpWWlhSWlVQeHZtSVR1ZFJjQ1ZlM0p4dFlFaUNvcnF0ajdZY2ZJeEZidU50?=
 =?utf-8?B?R3JlWERMQ1czUEUxWEo3U0lBdU9QamtxbHZsRFlDU202MzJIRTZuNmFTMWR2?=
 =?utf-8?B?REZ3STBVKzAyYUVSRnphb3puQ2NXOE5rWDJxa3dSN3N5MXlpR3hvNXRxelNt?=
 =?utf-8?B?Mm5TZHQwZU9rYU9nOU5ucUNFM0cyOFdhanJPeWhsMVgrY2NQQm5nTlNlWERM?=
 =?utf-8?B?VWw1eFJVUnlKci9SbytaRUlOdUpOdzlrNlFNY1ZTSlU3TzBDVGV0V0x1eTdS?=
 =?utf-8?B?bFk1U3AwT3BCRXdGTE5qTlNDZ1N5QVpqeWJTOHVMK0NlNndrR2oxYnA0aFB5?=
 =?utf-8?B?dHFRYUdqeXRrNnFQWkdaUFlIWXRUQTNkTEZJcDJ4aTRtTDc4eHIxOGdUd09T?=
 =?utf-8?B?VGVlVmlVK2dURklScDJmU0hLTkVsQnFlWFFOc3RucE5FY3MwQWNBelYwQ3d3?=
 =?utf-8?B?ZDhCRTY5N1Q0cHFrcGt2ZU8wVXpwMFNEZHdYWkg1ZnZiRWVISDVxcE9HVmdZ?=
 =?utf-8?B?cW4zcDZvcEV1QU5reGhiT3M5M3VieFJXakNWNWx4YWhvWTlpeHZTUjVKb2gw?=
 =?utf-8?B?UnkrQjlWNGVINkNHNjB1ZnNxSWZvTjl0enhWdmsybFFHaHh3Q3A0SHd3TDNW?=
 =?utf-8?B?bXJHck5HQkpSSW90WmcrV1V6OFUxdGI4T0k0clBlcmtMcEQzUDkxLzBqS2VI?=
 =?utf-8?B?ODVZdUd5WEpucVhHekNhNmI3ZXRBUm5ENlB4VHVLWEdrSGNNTG9RRElDck5Q?=
 =?utf-8?Q?zF4gvbLMx50xvZR6OSNu6ycx8I0SbKEq7zxnAkrfVbuPE?=
X-MS-Exchange-AntiSpam-MessageData-1: seHKmdpjES02qw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7533b2ae-cfce-453c-f919-08da220dfd94
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 14:07:51.2851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBYI4MuLvzNv3wxZ61q6vpPP5/OE/i5BJRHNgAvpGHzVmYRO12jX/9d6/E58l+EY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0017
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.04.22 um 15:59 schrieb Cai Huoqing:
> The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> which is integrated into NVIDIA Jetson AGX Xavier,
> so add driver support for this accelerator.
>
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
>

Well doesn't looks so bad on first glance (regarding coding style etc..)

But am I blind or isn't there any UAPI for the driver? I mean adding a 
DRM driver without any change to include/uapi/drm is really odd.

Regards,
Christian.
