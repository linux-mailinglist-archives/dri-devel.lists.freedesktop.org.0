Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D901C6C97
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 11:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F5C6E526;
	Wed,  6 May 2020 09:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6396E526
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 09:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krOvKOGrQ8QND+C6fbN5amvsBRyNNQIfEdgnowOlvt4=;
 b=17KislhxFkEq0RqIZCMpiBjOLw+P/yGwYOBlTQNXnDDvqkS5KohMLgDQSEsA1gnq3rqHa/MfzbtvXkyJVoATyOzxojPLewLlwUzMTAWr6NFx8P+gBt23ADGqY2pYLDYFWvHF8SK2JuIDucp7xSgaSAshiiIgx/b8mbwiMmVk3uA=
Received: from AM6P195CA0035.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::48)
 by AM6PR08MB4501.eurprd08.prod.outlook.com (2603:10a6:20b:b5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Wed, 6 May
 2020 09:13:37 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::1f) by AM6P195CA0035.outlook.office365.com
 (2603:10a6:209:81::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Wed, 6 May 2020 09:13:37 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Wed, 6 May 2020 09:13:36 +0000
Received: ("Tessian outbound 567b75aed2b9:v54");
 Wed, 06 May 2020 09:13:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: df6b87b3e5e79372
X-CR-MTA-TID: 64aa7808
Received: from de5042307d17.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D88A1F6A-04AA-47C6-BEB7-4821D4D430E9.1; 
 Wed, 06 May 2020 09:13:31 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de5042307d17.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 May 2020 09:13:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPugqb2H8d9OW7OS8yBYlbhoT77U0P1DCNuz4xlr5qRAA/jsh9Ejlbw9kv61nUBA+K/WVlPj63GkN3CVaSefcypQULMnvROrlNKyj0He5KefzcGLqe1Y2KS118h3v8s0D2Nk5jqhXU9TFNKrwaKXpv1unY0crnIK8IE8XnGOjRHQTvlkQZS3NzYhVBn0Z3xxyaV1VU8kTZ1/HmFS8AyS1P076uH6s86f1Y7UnSW2ht1ScoBq3LC7UTxct1xSbnJtWzCioibCc6/05IInh7vmH8Mh6Gf1ZUyjs7371cmo8DMHk/BzLBHr3DJTM2Y54Anvo9n5XuX/CBq3f0yigkHOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krOvKOGrQ8QND+C6fbN5amvsBRyNNQIfEdgnowOlvt4=;
 b=UW/UU0yRGuo1jm0UkkuQ4gH9wCowEOBI7ZJpLaKjo4sDa9KBBlcmT4KK+2PI5ZnL5HVB8Bu3FggaBFzvXWjFcfCYgPQsBz6yWJVQaACgoC1RqNY7SpR3FCAYkptYQfydFVzY3tssBvqJRzjRhFnz1WvcZtCA5B63zgq60srilUcYN6usnnhgf0dqe9hr8/04JWWHudNfQR2hgyFiB1Y2HxHhnwnhuLboEFDHpywcYKvZU0PndO4hTA2aO/IbcXAvSPx3Jx7xckculyS41RkzuAd1GYtFM3I3lAPyHHkdufvynvmY5tvHtpavEbslc7kF5df0aCMywwEe0AxjaMuqpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krOvKOGrQ8QND+C6fbN5amvsBRyNNQIfEdgnowOlvt4=;
 b=17KislhxFkEq0RqIZCMpiBjOLw+P/yGwYOBlTQNXnDDvqkS5KohMLgDQSEsA1gnq3rqHa/MfzbtvXkyJVoATyOzxojPLewLlwUzMTAWr6NFx8P+gBt23ADGqY2pYLDYFWvHF8SK2JuIDucp7xSgaSAshiiIgx/b8mbwiMmVk3uA=
Authentication-Results-Original: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (2603:10a6:20b:85::14)
 by AM6PR08MB3767.eurprd08.prod.outlook.com (2603:10a6:20b:84::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Wed, 6 May
 2020 09:13:28 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d%3]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 09:13:28 +0000
Date: Wed, 6 May 2020 10:13:19 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] dma-buf: heaps: Remove Unneeded variable "ret" in
 dma_heap_dma_buf_begin_cpu_access()
Message-ID: <20200506091319.yng6bgrnt3zrhb5s@DESKTOP-E1NTVVP.localdomain>
References: <20200506061851.19745-1-yanaijie@huawei.com>
Content-Disposition: inline
In-Reply-To: <20200506061851.19745-1-yanaijie@huawei.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: SN1PR12CA0088.namprd12.prod.outlook.com
 (2603:10b6:802:21::23) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 SN1PR12CA0088.namprd12.prod.outlook.com (2603:10b6:802:21::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.26 via Frontend Transport; Wed, 6 May 2020 09:13:24 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7dfd09a5-3ba8-4968-ad51-08d7f19dc274
X-MS-TrafficTypeDiagnostic: AM6PR08MB3767:|AM6PR08MB4501:
X-Microsoft-Antispam-PRVS: <AM6PR08MB45015CC612FDC13D50FA7E15F0A40@AM6PR08MB4501.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;OLM:1775;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DhfSSMbOMPiqYNjrhgN75yPf1uqAfZhIgSlgLLge5isFtOPgvra/mFSc2JTz25YYyIa0PK3aGY/ypQI/tMr1OrG3m0hLg9jIk8k2OydHmrEBhenTONr2H8bODveUdCICPO/f8NZdaXOjvqHqpyxuBLw87jvFjHZwTaTDf5B02zfg2/BDoybR7goOYBmD4pQMY4MUvb4YJVSgerFoQBvSPdVxQvAdctdUehz9NzUwTav306f42Y3u7iF+fFo8TLK+4nDaG8fbKUWFiuOVx+0EzElJK8g3sNDf2zxql1kUFVE1zLtOYHjlN8F/Hj5lb+3HIUif/vXKCC0npKHmAuooIo+uxOi92fbhhJ16Y7g58w/TSXxyDyfV7WMn7+gzSYj41gwz69rFKkRrV+Nxuyz+WGS1QdJ9BKVmgLTppEfhupxtdfx099ehbw7sjDqwuv1DnsH3rh5Z/EHQVclrWs5pVcK/wEKz6Oev22dZvFOwSLKRpfJZslFBgTtuUcniMC03SO1aNJOlhB19i19UwadDhA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3829.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(396003)(136003)(39850400004)(346002)(376002)(33430700001)(8936002)(1076003)(16526019)(186003)(66556008)(4326008)(8676002)(44832011)(66946007)(26005)(2906002)(66476007)(86362001)(9686003)(55016002)(5660300002)(33440700001)(316002)(7696005)(52116002)(6666004)(7416002)(6916009)(956004)(6506007)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 46Pu/M84HzailUcpWsDLr2Bk8DOoHtA86tkCsgO+uxhQeTuvXvYqMZWdoKwl3FWcXUu3d2dvV9IpBVUQmtqbcVDZJM9uku2T0MLu6oiLKSpvSE4iKDx/V+5ezVMqZuVfSJM0WKdP/i/Og5CrtoBnHqfleKeoRfzcBfFfgrGJ4XCWk996DSDvut0zuS/WBV0ozcaszm7L1bWo7g4dienbw65D7/DMg6C6yWzC9Pi35GpEDMu3HG3Vmi3HrVm8dFeTLZNqY7e2E0hhzAVmfH2qTPnrDVo5Lt/OiHN78V3IJhMZDb5sXe/pjEHOWvprUmQ3Q+9hyCxI05eWRp/pdvvHDFq8W5ha4KMR6CoD8nyUUxC5BRx082rELkrFWco+Cp+LU27uNWO+nwtc5ZL/SSKWU47Kpt1+19UqbraHCRGkwztwe1Aa7NPP2wo8Pk4CNuNpgpGv9TOHFk7LECHjwSH+xGfLL1Ek83EoBn6K3qqlnSUnl4kpAB1ORvj8HNKwOe3upaRo+hvpuElw6L+gyAoxtEXvSZ1/sWLAWnarh4VznXqDKmvwIVmta0R/vYEe7X0Rl1e8XoftKeJS3yXwZDtYIpzRmDCkKX3DLi+sFxzoU3PAVUWKPDyWiSiXN9fQM8UXdngAR0Y+cPr/2tRNwFLPmPDGKDN58JugnKJvmUbvOUcv66Dbk6/dOh/yZJcbHMJj2d7XsTltIrpMk4i5bgCYussa/r06Z7y/1vuujHh2Skk8tBkYluULT0npM6nZj4sIZaRgWDKV5PExmuW4CGaKPstL97Zr1nvSsJUOpsA3aeU=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3767
Original-Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(136003)(396003)(376002)(39850400004)(46966005)(33430700001)(8676002)(55016002)(2906002)(316002)(44832011)(478600001)(8936002)(9686003)(356005)(81166007)(47076004)(186003)(6506007)(82310400002)(6862004)(26005)(4326008)(16526019)(33440700001)(7696005)(1076003)(5660300002)(956004)(86362001)(336012)(70586007)(6666004)(36906005)(70206006)(82740400003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b58b4ced-5e8b-4a19-d881-08d7f19dbce4
X-Forefront-PRVS: 03950F25EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fr6aT7Py3K9rcShBflsyRT9zhEXKBCoDtYtnjYo07uaJpavlA8zwN9oXHLjPlhls/MHlvP/b8jhN0cmZLJEfCVdH5c0rv1kVJWTs0VuQBEBI98DXaL8JH+roLA0mtYpOmDtweTxxKv9zqKNr4fV5hm7ZHiNZv0yd8Fi4BlooYV+VdaWKljYdbz53tYH1IT0Awzi/JkDX94Tm5I/j9CAGGc6pXxBDUUbmStaMcLbvc4U2IgJanOT6jb8pe2YiQ2mlgnyA4Np0L9ARaykqtI6Nh+dQW2PXIjdVr1WX/nc8lK327aPW3iL4ldO22ZfqVt/TRjsESPRRiJCstoIKVyXr9eroF+5gdaVoL5LYhYSYb7Gv3GsPZIG78Bekge/9Rau/+11+G6BfrPtoViCkGlVZ85anIL0E0ZqQDf4X5SJd4Kf8SJT3U/qmwnvH+AykVfHL78bsbsccPUha3bhpneeK0p9W+ywLYY1f/tlzIr9MZhQ+NDch+zv30rTEWC2mSUtwtUMwFZaurRY7wHQZlcYDn7lffAOBKEVD1Es0wA0qH2L+hIu0kM8dkH4glMkCyHlQMnCQeU7L2sYc78i80NpSmg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 09:13:36.9760 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfd09a5-3ba8-4968-ad51-08d7f19dc274
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4501
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
Cc: nd@arm.com, linux-kernel@vger.kernel.org, lmark@codeaurora.org, afd@ti.com,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, labbott@redhat.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

On Wed, May 06, 2020 at 02:18:51PM +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> drivers/dma-buf/heaps/heap-helpers.c:203:5-8: Unneeded variable: "ret".
> Return "0" on line 216
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

LGTM.

Reviewed-by: Brian Starkey <brian.starkey@arm.com>

Thanks,
-Brian

> ---
>  drivers/dma-buf/heaps/heap-helpers.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
> index 9f964ca3f59c..c82872501ba2 100644
> --- a/drivers/dma-buf/heaps/heap-helpers.c
> +++ b/drivers/dma-buf/heaps/heap-helpers.c
> @@ -200,7 +200,6 @@ static int dma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>  {
>  	struct heap_helper_buffer *buffer = dmabuf->priv;
>  	struct dma_heaps_attachment *a;
> -	int ret = 0;
>  
>  	mutex_lock(&buffer->lock);
>  
> @@ -213,7 +212,7 @@ static int dma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>  	}
>  	mutex_unlock(&buffer->lock);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int dma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
> -- 
> 2.21.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
