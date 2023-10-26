Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B657D8813
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 20:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6557110E84F;
	Thu, 26 Oct 2023 18:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2129.outbound.protection.outlook.com [40.107.13.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2905810E84E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 18:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6ExTheGVrPIQXPHHxAGz5a7PDHHckfi0R/WJvgQw2P5W+UI/ljc8qUHsJ3YxUX6rocOWf6XrzJXMBMzSzjxAAXbD7jgPjX8f8xDak3T2dz/4hYZwbTqLvc8HfpOJfdJN0GaSYaeo1WMJtlZh4xA0Yx72YzjWnr2lI/ypUoK+ZHhF6102mU2dI8GAQfpFNS7qte1qqbglt2+YE2IkvyCrGJuqVqqUF+oXhBQLRKX2cN+LGxCOuN1IQL6U8vhqQpfEHwda4VYxjLCbMnIa+JYDi/ktoC4+lvKejlWSeN9XYQJcRwLPFQ2vzI64EQ01eVeXEVdg3y6apQBRqvcynfEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbykPy2fQm+Rv8lnS6s+o6e55EdYqNVpYsS4llfPv9A=;
 b=SvUmD6vxsrsXBR8YMDz4EwKJlmpk0pY9gip/D/k4BkM6uzpsTDDXHUg60cl7hIw0jmidP5+DLczJrqVoFtvtBpYqjLqEEgMrJElyr6uwYCw+9ZMdyiSJH0mF+Sw6ltAoDgdGe0Oh/PLeZu0K2nhOyjW5Be2OBBDRDYgNIdwlwp4ieRG18eKRgKQoMISn+R+iGhSclZ9mKuch+cn+7rMaPZ6/Ul9vR2n/kcHVJESdn5uFzzmo+Il4WhDQp0639e/aiZm1G1nrovDZjGKGPQMUYiHWY+fUcimmxw6jLxY6YXWLD+JEtq/anTPHQ26CEObpVbwmeqOjbo36jkSWV2Zvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbykPy2fQm+Rv8lnS6s+o6e55EdYqNVpYsS4llfPv9A=;
 b=Fyc27jIi2kVL2P5cpHI+kboT8wrr1f24KNzDSCMI5V4it2YsYfxFZp42xEG26/8rXNTPpjQnkPIlBZTJShwXDUYO8xN025CoCZjL+0ynLEIzyXdM6F+VR/z/RkSwRjeYk+BpvlC69unz65x89LxXBWwp5Er9B9QoGB9Pkf5esm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS2PR10MB7762.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 18:12:36 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d%5]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 18:12:36 +0000
Message-ID: <7e16351f-4d70-4451-b3c7-1dadfa41f20b@kontron.de>
Date: Thu, 26 Oct 2023 20:12:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm: bridge: samsung-dsim: Recalculate timings when
 rounding HFP up
Content-Language: en-US, de-DE
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231013031040.152282-1-aford173@gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20231013031040.152282-1-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::17) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS2PR10MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5a5b84-9e05-4a84-d436-08dbd64f21ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3on4p/0qE6LVKNOpuoPNmuocX/rGBZB8FwuzRa89BaxfwzMkemmNqs0uGwNlPWBiK3aiVD9UyDkQZnD3lGtTKA19HFenVwQUDc9PUtvoGWfzKDqn0VvrCaVNEfD/ITAKiWpJwozGFvdObgME+fQ31Fj2JtDd5sEFsZ/mPTES9aP6lOUpql/ydrBiqQGYx+cphTGgWVyFpL3JpgsbA3bpVcFscVAU5YfVR8uLfuOlvOkEhDkzCXGFI6VjKOh0dhZQcGYyNoZWy6D36UFyVlV2TRGrwnbBN7hv9rwgf/h50S6qU9J0gXVJaE+egXS+XgdrT/j13TQncBlHjutwTZJ7Iwg7zqP/KEedVJ+QL4mKm6QSI1+oz/4cssCUJ9XVX7lKpaaTzwSbNN28Iv1jHf9mVnpXpkik9XGkPkAJ6J9Pwj2k6duTbYLu95DNRv0XLwjySoI3JztsroLE7Y3QNJAuxph7TWPMXH/XeoOg6k7Y3ongz9TELNnRdk71TfBvNs8op7bvkt1dk9NGrZHH67cYfzmHJNAqau3pWGCPJ6tQD2ZbTBz8K6exeLXRX2foGTYWvzfUgwOyK2JP3wDeiOYPG16P0YMzGLivoLe8vHR93JTkPDuFHlxa3hdvg3CBwWtFp69h+YZqn1YTeFHvYbIFQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(376002)(366004)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(36756003)(31686004)(6512007)(316002)(66476007)(66946007)(38100700002)(66556008)(86362001)(31696002)(2906002)(53546011)(2616005)(6506007)(6666004)(54906003)(26005)(7416002)(41300700001)(6486002)(478600001)(8936002)(8676002)(44832011)(4326008)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UERrOG5TZlZwam11ZDhrT0MyM1daaDFKLzhaVGJSUzFFQVdOQlY3UFRQbDRS?=
 =?utf-8?B?WThpVFgxLzVnUmp1UFZUQ29sMjFzeW8xK1FjTkJjWk83cHdINjRFSXdqa3Vw?=
 =?utf-8?B?ZlZNNkJlZEwyUVhEdndaK0tmRDh0ajAxMG1rTXBKNi9tQjU3WjBkeFVSeWkz?=
 =?utf-8?B?dXBXSW8wSnBEQkI3N01sYiszK0M3Nnl5L29FY3lQZENFdEtTS0FCTUp5cWty?=
 =?utf-8?B?UkFUZlpwREg0cEFIS2U4bm9udXBGdVgzV0wvT1FEbThzY0xNOWs1VWRXang0?=
 =?utf-8?B?a2h2YkRRVldPaDFDSjFmS1F4TFhyeG1rTXVodVgyZTNoVGN0Z0tJK2xIZ2tj?=
 =?utf-8?B?Y0liaUFuSzNqRVRHdWEvQTBvOTNqd0tjSUI0OElBZEZOTER2NitLZlY5ZG0x?=
 =?utf-8?B?L1VMNmJKWUdlWkdlck1ZN0w4cWgveXJpS21VNDNCKzFWSGhXSGdKOWZ0dlJJ?=
 =?utf-8?B?dUJQZzJUK0UveUZsTDIwc3N2YXVPNzR2Z1dSVUJZQWxyQWJrbXlsK1FwSy8v?=
 =?utf-8?B?cVZFSG9lekE1ZUdFQkp6d2FFZ2JCWEJlelAvMHdaeWhiVThBckkrdXJZQndk?=
 =?utf-8?B?NGhrTXNjRm5URTZTZDE0SUxOTG0rd3NkZ3J1aVhPY2tHeDVHa0pLb0ZCaUNP?=
 =?utf-8?B?aythRmtsY2JNT0sweFRPVUdpcUozQ3BDRUNtbVV0Z3RQYWFKWXRsMmpHa3Q0?=
 =?utf-8?B?ak1SKzVNcS80OWtZaVpPMUpZaHZkZkZwUmNhaG1yazRYeUhYMmF2ejRMQ2Fz?=
 =?utf-8?B?R2swTkp2TVkya056T2lScm1iait2bjhac3ZWZDcrUmJEZ0tPamxlRDhWK1Vv?=
 =?utf-8?B?VHpJZXhxNGIvMUFqOEFEWm5pZnZqRng0anUyWFhScDlDUFllZUxEaWdobmJU?=
 =?utf-8?B?NHl0bkdvTzNsUzBiNU1SUy9KekpKczltZ29ZeThlTHd6SVUvTHJyQ0E0bHRo?=
 =?utf-8?B?YzhkRlBBT1E4ait1Z0hSL1BZYk15MjR5b05nbUpRUGlXMGhmaXNlMHBsRGgz?=
 =?utf-8?B?QWQrbzlBZWkzWHJUK3F6ZWRyb1BnZnlWdHo5RDRQSzU1QkdkbFc1VTRjQ1Rz?=
 =?utf-8?B?OTVsby83K01mejd3aGpmOUd2MUJzeVpBRjZ0enMydmFFQkhuODlTRnN6UlBY?=
 =?utf-8?B?bS80aEZtU0wyYjVOQURuaWpGMjNxS3ZnMVkyaVRTSUV5ZFgvZS9pbS9vZEhY?=
 =?utf-8?B?ZTlyazRLbTQ4dmp4Uit4dXJHanpVTnMwd1J1em5nSXVocmd0SU5KMkVRaXpC?=
 =?utf-8?B?b3pSWWdDNVdXRmdoUmhqRHcrOG81VXlBNkk0WG54Sm5FV2MzVms4NnZaN0wz?=
 =?utf-8?B?ZytVeURCNGNNMzJhMjFKQnlVZjNjUnZOelFqMHdoaUJPYUdnOGxvUVY5QjA1?=
 =?utf-8?B?YXVOUm0wa2hVWVQ4eTBDTUNTOTQ2M2ZJcXhSdzE3OVVtT0ZPSG93NGlicktv?=
 =?utf-8?B?QWVxeEZjZlpLZWYyQU5ZZFJTbjZRNjQzT0dscEk3SG16VUFDSHJpNXFSS0hZ?=
 =?utf-8?B?SlhFSmZLbkpML29vczJMNTAvWjlZWmdwL0RZT2JvZGh6WC8wYTQyQmdxU21T?=
 =?utf-8?B?WWlvZ21DRWdKQU9FY3lzNlVtMTRYSmVtMFdUTEVyekdIT3pKbENOMUwyN2lE?=
 =?utf-8?B?a1hWdHR5b2NyNnZIVEtmb3JDVi9JKzl3S3FCeDVSRlY1bksvTW90czBYalEr?=
 =?utf-8?B?YVpodjdWUDNmaDlCS0JQU010MHdwV3c3U0JGL1hyejBvS09zQVY2NTErc2do?=
 =?utf-8?B?czhSY3JjRHc2dG0zQkJNWW9hTWZLQXgzaEVZOGZJWjRRZ1kwL1RWVFZOTEJ3?=
 =?utf-8?B?UGxrdUx3SzlzVnljNngyOUJMckVUZFl1NHBGbkI3Ry9NL1h4bHlpODZkLzBI?=
 =?utf-8?B?MzhJM2FzbXIzcVNzZ1RqWDVBMU1LQU1XeHIxL1IreVZ6bTkzWlVVaUcwbzh2?=
 =?utf-8?B?VWdvZC9UQ29iaC9EYW5yZlRIOWk2TGJxWjRFUnBkNlJSY2xNK1JwV01LRFd6?=
 =?utf-8?B?SW43aDQvMHRFM1NKOWRObHZhMTEwbUFMdm01dERUYWMyRkk4MHd5V3k0VGxN?=
 =?utf-8?B?K2VzS29rMnJUVnVDQno1eFk3NUN4VVV3K1dQSHRUTHFvUm9FR2dlU1FTdm9F?=
 =?utf-8?B?Tm1qVTVRRjhDL1dvdGhHeFVjalhTSzJEMlNvUDUrQkpQTlYvYll2NVZrSEZY?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5a5b84-9e05-4a84-d436-08dbd64f21ac
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 18:12:35.9965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ExiqESiKpCi4ZLOjwazI2tF6FShHWoNzyINlCbubj+z3+RNx/qy7WdQ5gYPCG7w6fr09OMk/Z0oRR1NEjLV2089O3y8XyjnDsljI5Gv+x0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7762
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

On 13.10.23 05:10, Adam Ford wrote:
> When using video sync pulses, the HFP, HBP, and HSA are divided between
> the available lanes if there is more than one lane.  For certain
> timings and lane configurations, the HFP may not be evenly divisible
> and it gets rounded down which can cause certain resolutions and
> refresh rates to not sync.
> 
> ie. 720p60 on some monitors show hss of 1390 and hdisplay of 1280.  This
> yields an HFP of 110. When taking the HFP of 110 divides along 4 lanes,
> the result is 27.5 which rounds down to 27 and causes some monitors not
> to sync.
> 
> The solultion is to round HFP up by finding the remainder of HFP /
> the number of lanes and increasing the hsync_start, hsync_end, and
> htotal to compensate when there is a remainder.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> This adds support for 720p60 in the i.MX8M Plus.
> 
> NXP uses a look-up table in their downstream code to accomplish this.
> Using this calculation, the driver can adjust without the need for a
> complicated table and should be flexible for different timings and
> resolutions depending on the monitor.
> 
> I don't have a DSI analyzer, and this appears to only work on
> i.MX8M Plus but not Mini and Nano for some reason, despite their
> having a similar DSI bridge.

I just want to report that I have tested this patch (on top of current
linux-next) on our Kontron BL i.MX8MM board with the ADV7535 bridge and
I don't see any change when trying the 30 different modes the monitor
reports as supported. 18 of those work and 12 don't work.

So at least there is no negative impact in this case.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL
i.MX8MM with HDMI monitor

Thanks
Frieder
