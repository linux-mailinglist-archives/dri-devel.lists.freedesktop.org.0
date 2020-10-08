Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A128736D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 13:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7EB6E3C4;
	Thu,  8 Oct 2020 11:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE6C6E3C4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 11:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3HFokAane9spHajfbmBU2sGRfTrARrbB0mpL16vUbY=;
 b=AhbNqciz+CKd8/+PCO7wGjHMOvbz9zWX5s2KPPW1mubN7eKpgzw0PJ6Vlz2gfIiyKgdODuD02GwYMYTVcvvLq0b2e+KnqY8eD4+nMls3asG8nmONtU7rad1+DINvfBvgZlkUSBg8NSi0bPoAMtPsR8s19l7oa43u8rLIkAcvUqI=
Received: from DB6P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::34) by
 AM5PR0801MB1666.eurprd08.prod.outlook.com (2603:10a6:203:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 8 Oct
 2020 11:36:13 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::9) by DB6P192CA0024.outlook.office365.com
 (2603:10a6:4:b8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Thu, 8 Oct 2020 11:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Thu, 8 Oct 2020 11:36:13 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64");
 Thu, 08 Oct 2020 11:36:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d8294648a514f3ec
X-CR-MTA-TID: 64aa7808
Received: from 0d91f7f3bb11.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BF589622-750B-473C-B014-260B690B4138.1; 
 Thu, 08 Oct 2020 11:36:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d91f7f3bb11.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Oct 2020 11:36:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f05PR0R/4vMfvSi3l/V19liAl0VLHdLxP3I0GwrrvmOszCqmYm1QambQTp8nnT/0W6C/Y7yLKony1rdqu7RCh12EH7fwgGRpQV6/41/VvmR4EyU3WV3n+Sw0lTAhD4F3u8hDoWDPiOUymzSUdd8fGj/EVo3thSqwpug5eLJqgYBaGPY9zgpVu3pMbMz1z7Pfp/Mzys5Mp987n6OPbbiytE+TOrLffhAtlRLywfNDfH8qwH91wsDTmDUcIUeDmc2KtNyvpsKFYLFhKcxfNMFcfOGF2Gk6ntv/2B2t8ucViiRI8PaUuDIw7llZ/cRhKBWcO65AoOnRhBiESgIE2WlQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3HFokAane9spHajfbmBU2sGRfTrARrbB0mpL16vUbY=;
 b=HHzfx4nTf86WQOqKngvfO1RHm27A32qvstVpiveyWzqP50AhHPlbaWRn8pHun4SrSKu+9ZSCy6+FE1MaAOp65lc7CMUapDvhCJ6rO3Z0nsNe13OS3lLUMkaM1j+4E/XiemV3pLvMdlW+iVkbYwJxq4hA1xAtqz9dJ+Z4W6mzlb/5OLqoYfwgvy1BZTkOoYuIEpqlwNM2LL5KXHok0m606ws0d9v6IY4I9x8sHySKKMja7CGNAMsxHWJoECsb3iaWAto98Ohk6YtVVFG7rMBqguI4MkjM6FGjsxGSoyzDGP05dInWCWiIqtWuQXyiS04pueUymeQuIlXZ2ClEgoNnIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3HFokAane9spHajfbmBU2sGRfTrARrbB0mpL16vUbY=;
 b=AhbNqciz+CKd8/+PCO7wGjHMOvbz9zWX5s2KPPW1mubN7eKpgzw0PJ6Vlz2gfIiyKgdODuD02GwYMYTVcvvLq0b2e+KnqY8eD4+nMls3asG8nmONtU7rad1+DINvfBvgZlkUSBg8NSi0bPoAMtPsR8s19l7oa43u8rLIkAcvUqI=
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR0801MB1626.eurprd08.prod.outlook.com (2603:10a6:3:86::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23; Thu, 8 Oct 2020 11:36:05 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::5034:ca82:7e1:7e6f]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::5034:ca82:7e1:7e6f%7]) with mapi id 15.20.3433.044; Thu, 8 Oct 2020
 11:36:05 +0000
Date: Thu, 8 Oct 2020 12:36:02 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v3 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
Message-ID: <20201008113602.n7ju2hu3j6qsaxve@DESKTOP-E1NTVVP.localdomain>
References: <20201003040257.62768-1-john.stultz@linaro.org>
Content-Disposition: inline
In-Reply-To: <20201003040257.62768-1-john.stultz@linaro.org>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO3P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::19) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO3P123CA0014.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.37 via Frontend Transport; Thu, 8 Oct 2020 11:36:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ec4601a5-efea-47ff-0c27-08d86b7e5c84
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1626:|AM5PR0801MB1666:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1666516153C763781E778C6CF00B0@AM5PR0801MB1666.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lqBjNQMR/xffzOUBJ4tyNNmsmSVDSqOEZxTtJuAh76Y56aTi6EshOvxXL9gFm+RG06HS+sGhI7spi6bnc43BY7Ig0FhTb6u/TYj/aGoxIzPcLoeEtQ8xFTHuy8VakEA4O/GbiHVxr4AWHFbnccS/ItMJuXMxBZcIc07zaMeC/1nSd6erYJAQY7kgC20TJqKWxUasFLnG951A7cov5ijqsCY04RIPFJxIzE32s/JMyTtWOM4HEtpwmFHoyOeaMrgPotRgzlC4qk2CWRCngSNvvd/91fx6+X0NoO+ioTi/hYGADcov+7mUynFc/oC690STOHqzGQTCRcaLXdjsy43RGA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(7416002)(1076003)(83380400001)(478600001)(6916009)(7696005)(9686003)(52116002)(2906002)(8936002)(26005)(66946007)(66556008)(66476007)(316002)(186003)(54906003)(16526019)(86362001)(4326008)(5660300002)(55016002)(8676002)(956004)(6506007)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PdBSeHF47osDgyneh8DMgVSkiL7JH4CmM8nj/gYFODTcZQDosk8KjKUPJTRZNh8UVRQWpI1vTveFWaXm+HTFryPGd8W1MQQ2xLDpTR+800YAc1/u+Z3wzsuVTmvxA8nP9qgBLQSmiPycFrxdGyBPUGIYUdsVT7QaJJFjQXT3AZ2hAObSXMzmlBZ5oO7eZzXRKF8J7ISGi8uNiYiIbn/d+cnOXc/xQgJCVKhmtF1COgh4bCjuNdh9AN8JSYJLh9B6KM3IjvZpHpxQXs77mLBarmghpvCVqgeIxjfpb3FVrG7Yn7CCnWgzFFj9/Rp9XqCfmqZHcpeI/8aefc9kRfwpN/xJHJzaQSdFHolutPPZsTEOnmL4RBpLoPx3H2b/EAmTQcEyB0WbwGMQRda9Vt9q/zO4B1OA/oWomlVdKY1jC6jknn1fkhkh4Ncqom4izEfk3YXp1L4IYd3zMv3fHzuLCBwR7tEgI7/03OBP739WTfCGptSr+4w78FiAS441Oh/CV1zIdTj43Eb1f/kgQx7ZFPTfqYQuASr+36I0tHTsWBLbTF0MIg13rInHKZLKvudPgjp0arlx6EJmF7wVM1STA1FQVaZKmFuW9yJ/uUr0RaRhfiIL0bWitmnjBKIbBjqjFJKeL2SHz2d0pfVavQrzUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1626
Original-Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4ec49302-6cae-49f9-f3b1-08d86b7e5753
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 391yQbzxY10BBVdTu1r1nJZSeRFomKEyNLxfhG3kSdSBzIfnyBCOcBZ4FzxslYkN4PN+IOoaPwe/+vNlD217iUfiVqnROEiYVRUu8oY0jRH9gOmraaS7cgJ/3q0CA4a1UWW2d8TCdbLcAOQOUM5FessqdDXeoXCXv4ufZ28nm8NfmrFWarOHPuezLWdUUHYmSqHBHzY+1bZ6Qst3zBxPJ8puZ25r2rHehl/lY3lX9/HxuJCO+AItJ2I1PCXF0mLSZByuafv4BnCx8qpf6pteSHsWQ3+l8o/jG7U49TMIX3/rXHm0tgHYr4Tc/ae7KOUl3NpVo1upknLXI18Z0uvwj4LVXvSs5mA+p+rPPxk4Q356CplyEmBNQKEqfbWUZuusUXRFK4jXe60y5x40H/XMYg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966005)(2906002)(186003)(16526019)(6506007)(44832011)(7696005)(26005)(47076004)(82740400003)(54906003)(478600001)(316002)(70586007)(70206006)(1076003)(336012)(86362001)(83380400001)(956004)(55016002)(6862004)(9686003)(8676002)(81166007)(356005)(82310400003)(8936002)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2020 11:36:13.4984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4601a5-efea-47ff-0c27-08d86b7e5c84
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1666
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
Cc: nd@arm.com, Sandeep Patil <sspatil@google.com>,
 dri-devel@lists.freedesktop.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?utf-8?B?w5hyamFu?= Eide <orjan.eide@arm.com>, linux-media@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Sat, Oct 03, 2020 at 04:02:50AM +0000, John Stultz wrote:
> Hey All,

...

> 
> I did add to this series a reworked version of my uncached
> system heap implementation I was submitting a few weeks back.
> Since it duplicated a lot of the now reworked system heap code,
> I realized it would be much simpler to add the functionality to
> the system_heap implementaiton itself.

That looks like a neat approach to me. Referencing your previous
thread, I like the separate heap (as you have done), rather than a
generic "cached"/"noncached" flag on all heaps.

> 
> While not improving the core allocation performance, the
> uncached heap allocations do result in *much* improved
> performance on HiKey960 as it avoids a lot of flushing and
> invalidating buffers that the cpu doesn't touch often.
> 
> Feedback on these would be great!

Minor nit: s/detatch/detach/ on both heaps, but other than that
you can add my r-b to patches 1-5.

As you've said, it does feel like there's some room for
de-duplication, but that will be easier to work out once the
implementations settle.

I've a couple of comments for the uncached heap, but I'm not confident
I understand the implications of having the non-cached alias enough to
say if it looks OK or not.

Cheers!
-Brian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
