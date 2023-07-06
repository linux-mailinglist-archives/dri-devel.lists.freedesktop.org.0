Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC77497F0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 11:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7469410E498;
	Thu,  6 Jul 2023 09:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2134.outbound.protection.outlook.com [40.107.255.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F6310E455;
 Thu,  6 Jul 2023 07:41:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IquwfArR2TuLGkjVHQJG+YM1R+jPfJ9oxiGoWYEKrOeRK/iCk2jjuYTTXyahlOskcQakqs7kw6k23m8Aa8CZ8x1TnGuqiCyGTtjoLvQ7Xz30LHDNxxGvMWwTan5XOGJgNurmvh909ekJO3u48TDvcVZQ8KOpB5Nx2n2V2evYdlK6pa7Uj8B0MziUIgBTxWwPGgXng0+9CLm7SAPAooZZVFMc07uCVcJQeAdk6Wkq25bpZFC/Qi9siruCXfPyOVyts0H7jgxNC2jJJ5qQxi0WNO/A4WzZyQ3e7gCyNSmxSTjeLmKynU6Ms4Vu871+fnlS3wm/xyV+hZgsnm67uji6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AU/S1RWFTVxjPFZLm8LcZEqgDwvuS0geQfTvBvWwqA8=;
 b=Mv/PvvhGu6zIsHNkxDmOJ9NqKpbFkSDqoaF5mnsoetuB+FJ0J0n4dlnydHKj42BOemoDPv68msCKM/UjU9h9K92OhAf21GNwP3/mqHfC0UgcMec2rREP6WuYj+gxz5lOzWZC4RmnPbmA5+++//hvf0he+BpUEWV7f7jfJYZfGcJQ3MRdr9b3OmHy4VN4i+wn58pIbwXv7Avj29Jgh7Gqqn+vAEUarnzh4KXInkKn4/7rP+MnqWQVXvi2OmNtxUhQ1zCPJ2JhFOjX0txx3KpLplj/FvKZCYMewXjH8eoYh6JD3XD5sl67ZB3aDPnpIpi9VuTM/ZWJYRbKcx1P82I37A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AU/S1RWFTVxjPFZLm8LcZEqgDwvuS0geQfTvBvWwqA8=;
 b=RqLlx1GDgQy1Mkfcymrv+P1Zqa8rfwO3qUNiZ4UMlWLzy0bzjbO8VdSHBdZ538CZsXMDdZKH6lB2FgCur7f6kORknIrqSsYdXg4C2o9JSHnhtkcQ6SiAIRcu+LKTO9EWaC1KuVUe9HfIoXsk8MiKofiRA33JqJ2Vo5jZbvHYF22RWEK1G8u7H9jrrMEWrxKI3PwEFYllXcUw4gdJE4EfDN0O7FoX9EcGA2m+zNQJvjPZZ4A5sEBdV69G1SpRHN+hGe4nMv9GsSToROQbr+6nCOzm0kT9nh6cb9CwCpwmb4vY/OOoeYVMHNShfJi4DVuGvLWwl8H3PxXsblW5vWXpVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5706.apcprd06.prod.outlook.com (2603:1096:400:272::6)
 by SEZPR06MB6037.apcprd06.prod.outlook.com (2603:1096:101:ee::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:41:00 +0000
Received: from TY0PR06MB5706.apcprd06.prod.outlook.com
 ([fe80::d6ff:1295:38d7:a019]) by TY0PR06MB5706.apcprd06.prod.outlook.com
 ([fe80::d6ff:1295:38d7:a019%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 07:41:00 +0000
Content-Type: multipart/alternative;
 boundary="------------0Ua8p00VKL80vW5ZFt7MxecM"
Message-ID: <59751b3c-4102-d9b9-d785-c082ba4dbd40@vivo.com>
Date: Thu, 6 Jul 2023 15:39:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] Covert to use time_before macro
To: Zehao Zhang <zhangzehao@vivo.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 luciano.coelho@intel.com
References: <20230706064641.2296-1-zhangzehao@vivo.com>
From: Zehao Zhang <11162513@vivo.com>
In-Reply-To: <20230706064641.2296-1-zhangzehao@vivo.com>
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To TY0PR06MB5706.apcprd06.prod.outlook.com
 (2603:1096:400:272::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5706:EE_|SEZPR06MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: b15e3672-ca2f-4c40-e8ee-08db7df45805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BpDfUzjAKzmrrWzUbfcw0j3biQ2fRUupwBKHy/d5cfabD09GsxErkaQ9ffmW8+M4a6OrjTNPP0aoMonpefOoTT0WxK6En0rqbnCB44b8oBltjbSloBlYAMjaf2p7d/ndUUul88d4keu6tJ48otQTx4plGTKfe64mjbCy8sQGZEg2dVyi/kwPtVWMxK4RpxaSvum8nqbbowqjt0jqH7d6l6ZDo28Gz4/rE185s9c0lzcfNvjIz59VYlmAGgudvqCKKvV4IuctMhWdvQyeWaa7YRt+BhxsCtI6fhkGYL5ZqklPSUU8NtmBZXfFRPqqrv7OhLCueq8xl7WlCKFdLAXyMLA2lIPjJT4nMIYilJNELLFo+MBDiYB7eltHJkIO0UfMUYAK2oiO4yMd5/ZXcjpjj3UsbZ/+RD+r7s1u9gGRw4Rri+LijfzgCeWP7LhDYb1D+qkKndTTpO4hEwm7ksAJIe56YqYyBXM+GZvrMZXmqx0cNyf38LXbMAC6mjfXSZCOsOde2Jqk2XYN45qy/K0p5ja8NyVCpcnYZq37WbDcK+AJLUAXlshDY0rJmrPkk8dPC9ocyoZloXPKDw75P/MPBSJ//c7INtUYZAylZELSg0x8kfa43lkFq0bLw0/joYAcYkcGKeG150EG8Tg1k6xkImcYx2GftCt0RVe3zd98pYT9T9RGVhkeDrqJX9017zH4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR06MB5706.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(52116002)(33964004)(6486002)(6666004)(478600001)(564344004)(2616005)(31696002)(36756003)(31686004)(2906002)(66946007)(6506007)(26005)(186003)(6512007)(966005)(38100700002)(166002)(38350700002)(4326008)(316002)(66476007)(66556008)(41300700001)(8936002)(8676002)(5660300002)(7416002)(45980500001)(81742002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZCSDZzL0VaQy95ekhPOWtUTVlyK1lkL1JiK0VwUUQyZkU3V3MwcGpwbDN2?=
 =?utf-8?B?V3luN2Y3SElGZmUzM0FUYTBta2pFMkkxZXg0dmlpWWlWWmhGaGg2ZFA0WUtw?=
 =?utf-8?B?NWYzbmlTaSt2aWNWQ0FWSE4wT0dnY1UyVWRZMCtoV1FaN3RXQW1xdHJoMDlT?=
 =?utf-8?B?c3ZPVmFhYnVybCszYzRyZEp1STFjdnNFYjRUOE1iaDlVOE16RHRweVpDV3VJ?=
 =?utf-8?B?WkEwMDJTREtybnR4dnljN0ZFQ1FQOUxyOU0rY05iK2YwR3FIb3pBUHBud0l3?=
 =?utf-8?B?V3JFYXNBUzJ1S0ZLcGU0VUE5VVhqVy9hMml0Rkl4emhCNWFWbTJISW40K0Fh?=
 =?utf-8?B?c3gzNHRqM3loTkYydlkrZXdUMktkVmw3ME02c1ErbVgxVU5xcXhRcXFXWGJT?=
 =?utf-8?B?ZFd3SnNiNGY3RWcwU0JaM2xEN2Y0UkZFYkpPV1h5VHZuSjQwck43Tlh5UnFx?=
 =?utf-8?B?V2p4SHRkaW45aHBJbmhLc0p1bnJTakk2U05MOE54bGxOUG10NUJhM2RwNXNm?=
 =?utf-8?B?S0lSWE5vcVd6UW9LMVhWWXBkT0RXdnZhVngzc0N1YU56eEdBZnJpZGxxLzVs?=
 =?utf-8?B?b3FFVTFLcHlRNlJ0VUdldUhQWXg4UStHMVcvVTYxQjJ4dXdDRUEzazlBRVFZ?=
 =?utf-8?B?YWdMK3dOVVM3dWJmYXo1aFVJVHhpWnJ3QWFnNERncUltYloxRG1hSGltTmcz?=
 =?utf-8?B?NngyNlNielp2OFU5b0hDajZxdFRXSjhaOXB4UjJLbjgvYUxGYi9ReXZReVFr?=
 =?utf-8?B?WGhnMGl4Um50WEgxT21FamZ1SU1ySHZzMGtBdlYwTDNtNERsdnhOY203eHhu?=
 =?utf-8?B?SjF4ZTdQVm5uS3IrYWxEWllYd01KWklBUU5KTmtlQVJoUlhNRi9iQXZrdEZ6?=
 =?utf-8?B?M2s1SFVUYWlyQkREWGNlbjRsRGdkSFZ5bEUzNFMwTXM5eWVBY0JDYTZCNUNh?=
 =?utf-8?B?TnJzWHcwdzF4TjFwaXFuNEc0Zm9oRXB6OEd6K3JmMDJ1TE5tNGozcUpZK0c2?=
 =?utf-8?B?YThQNjF6TnZHa2ExazFIamJwdUhEVHp5OCtwdkZ0MndsWWNDbkFlak5ZWFM0?=
 =?utf-8?B?RFRvQ1lwMDBQcWkzMElIMlVFUU9tY05ab3ZIV1A0cjRVbm81elBnYkp3dE43?=
 =?utf-8?B?RjdtT09WRVRGendIU1N5NlVDcnlKNG0vS0VCcXk4WHVMaFFDaUV3MHJoc2kz?=
 =?utf-8?B?QmRhVVQ1NWhxcmxqeWY5QVFoY0VhdzdKdUI2d3JRbXA3Vm00bVpXYVhXcHZB?=
 =?utf-8?B?VGR1MjloY1NwQWxSY2NPZDNBSkZ6dGQ2c0JqUWpkUDBsbnMybmdUZ3dlbGdR?=
 =?utf-8?B?dnYyMk8wakRpZitvdkIxUGhvdlQ3S2FxdldHZUNLMTh1a1I0d250QlVBWTFQ?=
 =?utf-8?B?eEx6NXZ3Sm5tbUFIZ1BWellxZXJtb1ZLdVdqdnpJOEt5bitNYVRwRE1RSit4?=
 =?utf-8?B?MEpCSTBJdFNtUjdyMHpycnYzUktuN1htSU9abHFMY2xJdTBUMEFWUlExUUZE?=
 =?utf-8?B?T0FvNkVGYyt6V21oL3VWUW84U241TEQrcEZZNEFhSlhnbWpwZjhlajVvNmZ6?=
 =?utf-8?B?WUprSU1FV3IrNEpIRDRXQ2JWSHZ2bHdyVWQrOEp0M1R3RUd1b0gya2RHRHVO?=
 =?utf-8?B?SUo5ak1kMjk1aHMxSkNhYjZ4OGlINzBFOXZ0VFRuWFl6L01USlZMUkpsTFFu?=
 =?utf-8?B?eDcyMi94WnhFcnVPa0Z4akQwNlRuV3MxUGoyZ0g0QXBBSm1KMEwrcXYvSksy?=
 =?utf-8?B?RHdVTU13RE8rd2FTaDNjRHlxQmNqUkF3NFFoRW4zR3F4anpicWthWEV6OWR4?=
 =?utf-8?B?S3FKVkVzR0JpZ3RNS0RGeXl1TUlEVkUwalJPUmxEVURiWXU1UUExdytaOC8v?=
 =?utf-8?B?YkxrMVZsaVpzdEgzTGk0WTVUVXVXbjVkcDhFcE1DbkltM1VGWk4yeUZtWGlr?=
 =?utf-8?B?UlpxZEtkbXNnVUdGNWpSZGlhTCs0Zm1vUFFuV2lXdXdhV2hzWTNnZERQMWF0?=
 =?utf-8?B?bjQ4KzVLMHZ2b0ltNmVIL0pKdWduVWdQeWhZV3kyaDdmbDRybHgybWhQOHNJ?=
 =?utf-8?B?Z3Nhbm5ZeGQ3Vjh0c1hjZGlBR0VySFRwUDcvMDB6ejV3S1I4T0hxMDZwZTNJ?=
 =?utf-8?Q?FhbpfTXb9XLwsXtTq437zUgQI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15e3672-ca2f-4c40-e8ee-08db7df45805
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5706.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 07:41:00.7004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaSjKc05Q1LIl5bP0Or0SJI26Siqt53EHRGaH4eJDy5F8qsY/vQYDrWOZxjxyoVqrx0LFyPJ+zPJffIcMQHobw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6037
X-Mailman-Approved-At: Thu, 06 Jul 2023 09:07:31 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------0Ua8p00VKL80vW5ZFt7MxecM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Correct the format of the Subject in v2:
https://lore.kernel.org/all/20230706072924.2562-1-zhangzehao@vivo.com/

--------------0Ua8p00VKL80vW5ZFt7MxecM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <pre>Correct the format of the Subject in v2:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20230706072924.2562-1-zhangzehao@vivo.com/">https://lore.kernel.org/all/20230706072924.2562-1-zhangzehao@vivo.com/</a>

</pre>
  </body>
</html>

--------------0Ua8p00VKL80vW5ZFt7MxecM--
