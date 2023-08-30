Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3F578D7A2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 18:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBC810E55E;
	Wed, 30 Aug 2023 16:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2525910E55D;
 Wed, 30 Aug 2023 16:32:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M21IEf9hP41M8t3xSmXdPCZ7ezXYWtZj8Z+XWZdLiL+UaS8ek9rOWmF2p0+Sc0JI85RERn8953NukndknDXj3bdr4s4IgKWlz68QJSzVUp7wmo37bHMfEJ4Iy/DKt1Mo1H8U5BylfVH6mQfxLBjFLJ25LdyXgEuuCkwW0BoXZYuxCOzd/QZDXmQjzJLvvWw9kmEw7OgDwgkWoxdjtj5hTruJebc7DP3OoA3K4ikDTjdUSdEGwNfJBCbYK8he4gdEgw2ibIRr9XZqaM7cGdZ9CJ/FifzJyRW9fSfsr07F+LE+iJPBpq+oDjbQuoUk28z5ScK+utiJb0KEKeZwkOnAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TajwlNvQ0OKMMheYRCNntBmaMaZlGhlIz2jiFyYTVqs=;
 b=GAmcDecAuNaYDbjarxoG3tCg3BtzVPxai2iH5Ca1TXmHHHOEXvq2mzMMS9M5voTHIeQKeECPahifkRBtRggtDjU80u9q6jvy5NCe+MLfqTnxCnHNqsUzAn+k+LneWxAQrXUk9TpSqAxJUWan7VfVaOiTb1WfFU+PWYvG49f8M5AlBV9Ue4wYYACVaEsQNrqT/PsDO7Cda8+sWRRpOLBu225WPtYOowJGhoNMM/TSRb+9OVtRL2EJHOyJ5A7WY0+zE2pWXU9NOI+3cboIGEv/yVF+LfZqmcV790QbnzGbxe1m8al91hHyg+rw0iQg74liE/WaRw8yCYnbqu1C+6TXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TajwlNvQ0OKMMheYRCNntBmaMaZlGhlIz2jiFyYTVqs=;
 b=pYW4sfaK0xmpZLH9yReSJwUGyVOzckfSZMCoCDj+B9ZKDpaR5ilBoBbc1vkcYwVTdQKz0ThR+st0bFWFvfNDA6+jBsJdt0zNoVvzEuAmRXebdXYyzNLRtb2ELjO4SWd/t4EaA0FPjQiK7MYNS3MFw8CwIR5svMBPcis4la53+vM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by DM6PR12MB4420.namprd12.prod.outlook.com (2603:10b6:5:2a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 16:32:04 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::ae93:e5c5:41f7:bf08]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::ae93:e5c5:41f7:bf08%7]) with mapi id 15.20.6699.034; Wed, 30 Aug 2023
 16:32:04 +0000
Content-Type: multipart/alternative;
 boundary="------------hkiFFavmOu6H0A0XGVv4NrOq"
Message-ID: <d82383a0-7ae9-f974-654b-864f09e7372b@amd.com>
Date: Wed, 30 Aug 2023 12:31:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 0/4] drm: Use full allocated minor range for DRM
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <20230724211428.3831636-1-michal.winiarski@intel.com>
X-ClientProxiedBy: YQZPR01CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::12) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|DM6PR12MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: 03391836-f0e2-4e42-576b-08dba976a4aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjS6TcOrIzzX2qV4wDmVdF0Ls19LfW5xen2Cu65zxWx9p26BcinCykisgBdXst0ZTnfuX/b/POBfE5iusA7ao+k3dfuK21ryvggYl/y3dWnlOJxc/eo6dqkM7yAw3O0MIxCLAPbI70gjL5IO9L023KFH0zR/LJ3YEUSEKcoyqaiUPP3cIQCO/3ZnBrUGt3iFFh1YjYUnPzkSkW+qhMtkVNEfkYkO/AhTq9tWDXBFF7xX4e6jciDMPXpkgU7GTjbo61WAySotDIIukMapbohaLg5Vk6x6NrDdrpxI+H/FjTKjG8Xr9G4w/rFEeq1/k8VoglwTQxurca68mAb4t1LTAH2NPtO3TlpTCfC0kL1mV2vlztDbyhmKeEM2cfH+MAPPSQSn8VSWSChQQZIChEPywIHrnH489vcpHG+vjYonQvZXMGpJSLv+f8jkR0olMylUYUSmRWB3fkU9HnESwF7qMcBQ51T+cmUu46/Wn0yjkK7IrwXWLfYXBYv8MHuyB28GWLkUm4PP8GsCqar3cE7nJzNTf5SfMokmc6Ew7VzaCB0DQjayWtCRviqoQKOqm21KvicfPXrVGmSoO5Rm3bKlZkWb0kcE6Ifo5QzwpEheS9Ozn1EsIFxrp1jT+ELgYPmoNuPFdnNZsp1cXoOlXe4GnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(186009)(451199024)(1800799009)(54906003)(66946007)(66476007)(66556008)(316002)(478600001)(38100700002)(2906002)(7416002)(31696002)(5660300002)(8936002)(41300700001)(4326008)(83380400001)(8676002)(6512007)(6506007)(6486002)(6666004)(33964004)(36916002)(26005)(53546011)(2616005)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTNQU3JUYXJmcW1ZR0UwVGZKbm5vMjZCNHQvTGZySjExaWV3NlkvK2hwSE9Y?=
 =?utf-8?B?MW1hd0h3a21xQTYwYWYzZTBuVVluN0F3MlQyV1BhMWo3MzFPblV0bzViRWFo?=
 =?utf-8?B?aDBQVnQrcjNqOEUraVQzNnFQU05uS2NJTzVGWWplajRKYnJkc2FMaEwxWklS?=
 =?utf-8?B?ZC8rYXpGOWNhQThiaTI1eFkrcERuaGhiYzM1R003TDJJQ2dIUkx6ckZZdVp6?=
 =?utf-8?B?SjdSaGtMMXdQSkZzODljOTEyVEdTYzMvcElISmFnUGhhMGZJNXdKUG8yQXQy?=
 =?utf-8?B?eFF4dWdZMnZJM0tKRHZaOGt6SGtlRXJUbDVVdjV2WDkzd2U3Q096Rm16bmhy?=
 =?utf-8?B?MmJacHcxMkdkZHpZTWNqMlBDN2kzNElsbVR4U1U3ekJIbm40d1pDWHozdlpk?=
 =?utf-8?B?cGI5UWFGWnJ4ckMrR3pNSXI5dEV5ZTFnb1kvNkY0SmphT1dHQVNNMGZvRDFX?=
 =?utf-8?B?Uk94b3JQS3NndEhzbHI5K0dHdUhmZkhBdlRLL3gwY2tRVDFaL3Y1MlR5M3g3?=
 =?utf-8?B?RGFSL0V2WkdaKy95YitsSS93a21sVnFJODFzdnlVNmpHRHZ5VXR5aEh1WHNw?=
 =?utf-8?B?Z3ZtbGxLcXRFdWx4ZjZaY2FKQ0RvUkFDRnd1U1hQYWZ2eXlXTHVoRzAvUktt?=
 =?utf-8?B?bmE0OEs5aVZ5NkxwSkhHaUhkQkVnWW12ZTVzK09YYW8xZ25EMGFrZlJ6cFNp?=
 =?utf-8?B?c0NQNlhHYVVSQTRvN1JaZENGNDlZcjNTQUc1RXVHME55N1ZleXdTem4rSzly?=
 =?utf-8?B?QzFRaW8weXdJdjhIUDVtQ2VYTG5uSUUrbHJJclBNK3UzUHF0MGNSeXV0c1dJ?=
 =?utf-8?B?M0RKaThDUDFSRHZWZG0rSlNHSjN5YTlNZVlYRGdBVUs1Q2x4UlBSWXNKRitl?=
 =?utf-8?B?K2MyUWNDT1M2SlQ1aU81Vk9nVlloQ1I2aHpVR2RHRDVwaEVvclJwcGhpQUVU?=
 =?utf-8?B?cUQ5WkJ5WlRnKy9EQ1RYRk93ZktydCtPWWdYTXh2Yjljby9pakxuR3ZLUFF3?=
 =?utf-8?B?TFF0SElzeXlLZzRIR0ZHaWlQdG9sWXNkdFp3T2Z1SkxNV01oaUNCYzRoYnAx?=
 =?utf-8?B?YlZ6WFZwWGlocWg2MHdUKzRtS1BpbXNxT2djbVlpc1o0QjhVOVR3dnk5WEZI?=
 =?utf-8?B?ZllUd1VyaTJobUJDVkpPYUtISUlpV2t2UnpHTTBEUVBGN3RZUFdJQ0poejhC?=
 =?utf-8?B?cG9oTE0wLzlnRURmcWNad2dUQXNoQ2U2REhzUVptcWl6ZjRXdnA4NWExYlM2?=
 =?utf-8?B?enAvd2VDN0MydWFHYUVaeTBlWWExbnduZXhWMlQ3Y1pscjRSckFVLzMvc0VE?=
 =?utf-8?B?RXFYWm9QTG1VZTBFMVUzNEdwSXhNR0tZNjNRenhsVnBSM3FEdEFvZ2JON0xh?=
 =?utf-8?B?ZXJ0TFN2eWpIZjVZeWFXMW4xZHlyOGxWNElxWWRYMmxHV00rbW5JQnpKYnh0?=
 =?utf-8?B?dW9FSStXTkhyMmJWdFpVZnNmdktGRUwzT0dZWk9UdUxoM3k5dGZDeVNzNmUv?=
 =?utf-8?B?UkM2aEphREI0aXFUNUd3OEZDb2ozenlONkM2WURnV0pwUXpDYXFtT1BJbVdX?=
 =?utf-8?B?aG1lQmswRllvbG1IQVBZd1lCWDRiSXkxVEN0T0RKdVBUMDZNUGwvcEtKZTRa?=
 =?utf-8?B?V2pJUGdIbUdZVCtIOVZCL0RVbHFRUk45VHJ6RzFzMXhvbzRobEJScEV0RHor?=
 =?utf-8?B?Um8rNE5ZSW83aWhoRFMrNkRnZmRIbTYvM01BVjFsWG5neW5WV3lCdkZVd0ZQ?=
 =?utf-8?B?K0U0cElzemx2aHlJbU9TRGpKOElkdEVkVnIxUVRDbFdZbnVOWHpnbFBHTGN0?=
 =?utf-8?B?MzNDaUxvRXBTWG5xc2VzNElobHJMUU9lVEQ0Mm1BSFVzUG1IMzVRODVacnpW?=
 =?utf-8?B?Q1FGckZqOCs1Ykp3TGxtTG1vc0VJNU5vVkRtWThoVDYvd1k2TEx0ZTZVcWgr?=
 =?utf-8?B?aEFjRHV0cGl3dmhkRlpjNzEzNFpvUm1qWkVKWElZSWdRcnR2ZlJkZVo0M2s1?=
 =?utf-8?B?YTBPU1FxTjFaM0UwTXEzMmkwWDU2TGU3Qkh6cFpRbmpYTlB2bHBZZEIxYUxK?=
 =?utf-8?B?dnhXWjd3QkdORWJVV1hUTzlabGQ0NUQ5RTJrN2g4WlRXWk43Q1c0MkRRbE56?=
 =?utf-8?Q?ood9d6uYC9SefhrqdX5AHhf29?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03391836-f0e2-4e42-576b-08dba976a4aa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 16:32:03.9126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZuyJDk2YzSXBvMLzo25CS47ofEh0/44gnPhtVgvdVsOJfIOgc2h3XAFNYH4RnUX7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4420
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 James Zhu <James.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------hkiFFavmOu6H0A0XGVv4NrOq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

PATCH 1 and 3 are

Tested-by:JamesZhu<James.Zhu@amd.com>

Best Regards!

James Zhu

On 2023-07-24 17:14, Michał Winiarski wrote:
> 64 DRM device nodes is not enough for everyone.
> Upgrade it to ~512K (which definitely is more than enough).
>
> To allow testing userspace support for >64 devices, add additional DRM
> modparam (force_extended_minors) which causes DRM to skip allocating minors
> in 0-192 range.
> Additionally - convert minors to use XArray instead of IDR to simplify the
> locking.
>
> v1 -> v2:
> Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)
>
> v2 -> v3:
> Don't use legacy scheme for >=192 minor range (Dave Airlie)
> Add modparam for testing (Dave Airlie)
> Add lockdep annotation for IDR (Daniel Vetter)
>
> v3 -> v4:
> Convert from IDR to XArray (Matthew Wilcox)
>
> v4 -> v5:
> Fixup IDR to XArray conversion (Matthew Wilcox)
>
> v5 -> v6:
> Also convert Accel to XArray
> Rename skip_legacy_minors to force_extended_minors
>
> Michał Winiarski (4):
>    drm: Use XArray instead of IDR for minors
>    accel: Use XArray instead of IDR for minors
>    drm: Expand max DRM device number to full MINORBITS
>    drm: Introduce force_extended_minors modparam
>
>   drivers/accel/drm_accel.c      | 110 +++------------------------------
>   drivers/gpu/drm/drm_drv.c      | 105 ++++++++++++++++---------------
>   drivers/gpu/drm/drm_file.c     |   2 +-
>   drivers/gpu/drm/drm_internal.h |   4 --
>   include/drm/drm_accel.h        |  18 +-----
>   include/drm/drm_file.h         |   5 ++
>   6 files changed, 69 insertions(+), 175 deletions(-)
>
--------------hkiFFavmOu6H0A0XGVv4NrOq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>PATCH 1 and 3 are  </p>
    <p>Tested-by:<span style=" color:#c0c0c0;"> </span>James<span style=" color:#c0c0c0;"> </span>Zhu<span style=" color:#c0c0c0;"> </span><a class="moz-txt-link-rfc2396E" href="mailto:James.Zhu@amd.com">&lt;James.Zhu@amd.com&gt;</a><span style=" color:#c0c0c0;"> </span></p>
    <p><font color="#000000">Best Regards!</font></p>
    <p><span style=" color:#c0c0c0;"><font color="#000000">James Zhu</font>
</span></p>
    <p><style type="text/css">p, li { white-space: pre-wrap; }</style></p>
    <div class="moz-cite-prefix">On 2023-07-24 17:14, Michał Winiarski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230724211428.3831636-1-michal.winiarski@intel.com">
      <pre class="moz-quote-pre" wrap="">64 DRM device nodes is not enough for everyone.
Upgrade it to ~512K (which definitely is more than enough).

To allow testing userspace support for &gt;64 devices, add additional DRM
modparam (force_extended_minors) which causes DRM to skip allocating minors
in 0-192 range.
Additionally - convert minors to use XArray instead of IDR to simplify the
locking.

v1 -&gt; v2:
Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)

v2 -&gt; v3:
Don't use legacy scheme for &gt;=192 minor range (Dave Airlie)
Add modparam for testing (Dave Airlie)
Add lockdep annotation for IDR (Daniel Vetter)

v3 -&gt; v4:
Convert from IDR to XArray (Matthew Wilcox)

v4 -&gt; v5:
Fixup IDR to XArray conversion (Matthew Wilcox)

v5 -&gt; v6:
Also convert Accel to XArray
Rename skip_legacy_minors to force_extended_minors

Michał Winiarski (4):
  drm: Use XArray instead of IDR for minors
  accel: Use XArray instead of IDR for minors
  drm: Expand max DRM device number to full MINORBITS
  drm: Introduce force_extended_minors modparam

 drivers/accel/drm_accel.c      | 110 +++------------------------------
 drivers/gpu/drm/drm_drv.c      | 105 ++++++++++++++++---------------
 drivers/gpu/drm/drm_file.c     |   2 +-
 drivers/gpu/drm/drm_internal.h |   4 --
 include/drm/drm_accel.h        |  18 +-----
 include/drm/drm_file.h         |   5 ++
 6 files changed, 69 insertions(+), 175 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------hkiFFavmOu6H0A0XGVv4NrOq--
