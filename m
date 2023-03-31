Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6ED6D1CF2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8977310F19D;
	Fri, 31 Mar 2023 09:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2065.outbound.protection.outlook.com [40.107.241.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CDA10F19D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:49:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONJaYhju3Uyp60lYxZjcF+FybrvQhsRnEeuCr6pd+5D1+5k6yUpGx5iVQQXq7EJoaZPurItNeNpHfVX7KuMqwVZPatMSxK0VX2QNsSwUJ2ee8cUnZyWoWst6SR+zujeFQksW7f4t53SIh167gQJYI2z1Ehf8IIsnixJUTkWVjgWgzQFAGbHp17U/g995WiRVX1hrPEHDYUBEZvLNtSaENUinLlxI8qfWNnpnM5vAYK+BStydwchsKwwifraCrphgOJ0uBnr3YDYM0a9G4I3E6qTQX9RVaGvM41vSPLGV5nBeVbmR2sOKNj0PTySXsPa2m9V3I/bhgOdLbT+IJzFw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhvovfwYv6scvjZyvWWzgOR3RJGkD0sSbkBBYEyXpnU=;
 b=I0rpL98ie2TW8WnxrKery5EHzNuQJ4GmkBq4AIZr+VcWy121ZDmHFztiSr+NuCFIM834Rn1y9f6/8t6tWcMaym9T0UBZuLq2V9Xi6epHi3j21IkTAako3aHG6McQcmsjEMUlERnxzmSXFyqlMNZarX/BwiTQK1CySZ/g3AGBm5v0L3cV3tvKqa8SMVIjVTHJOdehpNBO5o76aK18dVWeLeH2/TtBzJZzt7/uNCbSTZuqR9iKVhFgMZ97UtOsaiWxCQswh62K+KxdsDdYX9vxyRs163pCKXIyRM+Plph8oTMHky8iCcmAyOxcJZIsNmV2/z+i0eR4YhFIJHbbNzGnrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhvovfwYv6scvjZyvWWzgOR3RJGkD0sSbkBBYEyXpnU=;
 b=jMRSdpNx8kF1vr4SkJ0vFgwVGMLw9RebDOfPUkM50OiO90qP8+Oc1e3hQKLbsuffRFRrfCYj5m5tvaRfufGW4/H31nfJCgE5vmhDm6noOSb4ZCM4GY5kOeDGiN7mvakP2U9F3oP08+ByK+ZogShOaQembII+phj9tA4ukK1afik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AM9PR08MB6291.eurprd08.prod.outlook.com (2603:10a6:20b:284::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 09:49:46 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1%5]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 09:49:46 +0000
Message-ID: <211e3b03-96ee-e0e5-95aa-3b4094a18237@wolfvision.net>
Date: Fri, 31 Mar 2023 11:49:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/7] Add timing override to sitronix,st7789v
Content-Language: en-US
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0191.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::10) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AM9PR08MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6f9618-4179-467a-6ae4-08db31cd42c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t49Sw/T/0GCIkOwlM0qHGZu7YzSIQNGlw/cL5xeN7DGThRDqMoO0JfVE/aE/jG0IDgwwROaeSYzs2eASgfN1sMla9Cgbthbdc3NI3IrZ2beiM0yOO9bMGbX0XWceTftSK3zOG/GZ9pv3BgNF4aZUHIjnGL3qQpChByu9GfTDQ1rHhlTzAXw60htN/o0aewk6VCcXjPKxmEYZclmHG+hoVHCAqef61AF4RSMxbZKx9CzOSXji/8lCA7Vdjqjl0it1W64SozDMeQyupu8hXXr9a7XOHLuOgzrTXnHMUoMSjHmFXm+nz28Q880dP6VbAcJNrQ/iLkdM5OgG/Vwcs9maoSTtBjCUtHa3LAN0hKTdEIoXfNscT1Y1G3wmt7GZ05HGpgbriOhLn/sK6UYMDusmztQ510ksK3YFno6ehmGOopBrPabwrsxCSodE4h6naWjT6WMqCLsmkCsQFJQ/edLqBAiQRaavMc2Q60qxMvEChHk4HK0syTGu+1+ElecaK3/G40ajpAdrlzhj7kmXwin2AO/Nh0w0v13BNQ+uSFCuVr4M2WHsNoctho5QhAcER8HDeYJqW503qor/gF7fvIgBZAzWHDSE3H/ulEiQ9O/7J9BIdppyFk+60nPWYyfJ+USf0lNUbUYOnagbnbCGWfHsXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(39850400004)(396003)(451199021)(36756003)(54906003)(8676002)(4326008)(6486002)(316002)(66476007)(66556008)(66946007)(478600001)(41300700001)(8936002)(5660300002)(31696002)(2906002)(7416002)(44832011)(86362001)(38100700002)(2616005)(6512007)(6506007)(6666004)(186003)(83380400001)(53546011)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGIwYnNwSHB2WVJ0L2dLZW9qSlVPSHZubDhKSGNLWkR1MWh4SGVRQmltZ1NP?=
 =?utf-8?B?Z293cVRYNXZ0UU44dk83OFJnQkd6SzJCakgrWFVDSVRvYi9RRzVPN3UwaXB5?=
 =?utf-8?B?U2J3Z0ZCUjc5VUFNeC9sZGNOTkNqeU9PQlVPVWt3RVFiTDRaQzBCVlRZSWxx?=
 =?utf-8?B?QnZldkZWRXBJTWxjdzdicnV0cEJtNURlamlVRzJFME15aHR3UFFYbXhPSzNP?=
 =?utf-8?B?dlk5OStyQXQrR0RlS2Zpd0NodWhGOGVScE95WDgzSWRZZjhvNmIrUUZCeFBx?=
 =?utf-8?B?TzlacmdRWmlNRFl4NzlhZGpwWXdpVitibGhDRG1nbmdRYjFac2ZmaXczejk3?=
 =?utf-8?B?WmlOT3dkaUtmYTN5cTFXRjdMb2JrSDJqQkEvU1JEZG5YSk1oN00vbnVnaEh5?=
 =?utf-8?B?OU54bUQ4QjlIMzYwbWEvUlQweHF6SGFwQzRtM3FiMmZpblVkS0lvOGt3QkM2?=
 =?utf-8?B?aXhXbnB4YlYxQ2lOOEFkOVk4UXFKeEhWd0tGY3NQNzc3T3MvMmJnRDFocElj?=
 =?utf-8?B?c0xUNTJSMUkycjUrMmNzMnVUb1hnc0lFbzRxdEFtMkw0Wk0ySlZCSGsvY3Nj?=
 =?utf-8?B?Y1NJL24xcFlkV2hDL016T1ExWksvRVhldnRHN0EwbjBVeWpDRUZ0SFF5T3Ex?=
 =?utf-8?B?NXFDZTlhTE9OTk9ZVFl2S3F4b0NnbE9nRy9TcHJVUTgzMkxnQzBmTVgvTndK?=
 =?utf-8?B?WEp4cnZ4a3lDY1c2ODM0NXBuWnhBbGFYejV2Z3lEbEN2T2dmbHVHOGpHWElV?=
 =?utf-8?B?bGoxbFpiaXZhY3hVY2xFbDM2ZFRHOFZHa2Rta1cvNWk5T21mcUhNYklzZ04v?=
 =?utf-8?B?b0F1VDFESTBIT0tUeWRKS3I0VDY4VmwvZ3I4emxiYk5nb1l4S202NWI0UVUv?=
 =?utf-8?B?eGpwZk1GL0o4b2FwZmFVTVNKZTEvSHBOVjFveDhVM2paVTF2YkxnaEdXUXJj?=
 =?utf-8?B?b0Z1UjlSWUI5K2VHeVFKdVYzWmQ3VHFndHhBVHRENks2SmlCd1dJNXlvcHBt?=
 =?utf-8?B?ZnJIMXhFVjJBT01oV04rVDN1WXIxa093SlpRZWU0d01HYUdyT0Y1eGdtMHYr?=
 =?utf-8?B?MzlSSHl6NHM1MWVMVUhKdU8xUVhBMDFtSjRUNU5tbVFXUzVuZDUxS2tudVlY?=
 =?utf-8?B?UFNEOHNLSUtrTjFORjZlVGVBMUtRTktJcGNVZnZNMVZhMGhHUlFRNzMrOFRm?=
 =?utf-8?B?UmhHMVVYS1E4dHg3L05OVDZQR09MV3V3VWpmdkpEcFNqRGpXaG1PZm5Sblc3?=
 =?utf-8?B?YzVHcGVtT0lYamJPYnFFRUU1aTNhOFkrSThGS1hGbDdxQnNEQTNpbnFveEFG?=
 =?utf-8?B?RzZ6R05CblVSY2V1ekNNRUU3RTJ1RUxsaWJHb1BOcEVJQy9DM05XNXJzWXpN?=
 =?utf-8?B?QkN3bjdaRWdwNFJ3djVLdnV1VUsxbXFieFdnN1dpekFKWU9RZDRmMUNLZ2Yy?=
 =?utf-8?B?M0NmTW9RNXdBUXhjSXRUanNpT09iWlVjYzh5NVVNVHVwSXdZYW50VmxvVVUz?=
 =?utf-8?B?M0tUZDVDd0N0eUxDb3E0SDRzb1VSN2x1cWRTL2dXR2F3OVZhR2wwWHY0QW5E?=
 =?utf-8?B?VUZLTmtUU1cwV0RsZVZpUDYxbU14S1ZURFVJRWhzZVU3ejFvazRNOU9VTXdR?=
 =?utf-8?B?RllpK0phcGpEV0RDeVkrWUxmY1ZxWGFyS1B1eE9SdXdwTlJydTZkMVpGalpK?=
 =?utf-8?B?dC9PZ1JXZnhuQkJLeFJPMXhEZmZKZ2l1MWl2b2hoY0VUWmtOWFd3SGNwQ3h2?=
 =?utf-8?B?VXMrYnkrcVZOTGxVVFhDRGltc2xBLzRpaHdiV3ZXUG1KcHk5OE81dkI4RWx6?=
 =?utf-8?B?ZlFRdXc5a0lGNTdKblRDWDluQW1KZkdUVUllWStzSGFIMjlXTC9RRU1UTHVJ?=
 =?utf-8?B?YkpFREphZWlUZERYb0svdk80S2JLdzAySFB3TldXNExQNS9UQzVhYUQzQ00v?=
 =?utf-8?B?QzZ5UXZQTllQdjZtUXhhWXY5VXVjdGRNc1RTN3ZJdUcrRGttTUhLQzF5OXNr?=
 =?utf-8?B?UWdmVWozMDVDMFVQQVZoRC9PRHMrRzVEN2ZldXI2R0MwQmRKT3dReXR1NVJx?=
 =?utf-8?B?YUFQUEt1YWwvQmxpblFxM3BpczkwMmF6c2J5VHQ2bzd4amtyYlQ5U0dmbERF?=
 =?utf-8?B?aThmWVRwWHNnTnVLTWxqOXFYZWg4OXhHZityU1hVd29Kb3oyOVM1elNhWTQ4?=
 =?utf-8?B?TnhZRVdSR3czL1lwS2FCaDNwWVV2ekUvOUtVTWFjb3YzbG9HUnRoVVZQQVR4?=
 =?utf-8?B?TndmT2pNRWFxYnhmQTF4UG16MnFRPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6f9618-4179-467a-6ae4-08db31cd42c0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:49:46.2405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXWUPRSmASXodpcOXFIj9njUv/adUVpFTbRvyKr8TYdgAs7Q4mewzMjUNmbPaHV9m0NdwZXjj3AMf3gNtm4Vzhqi0Ep16gac/eoNdgVW2rU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6291
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On 3/14/23 12:56, Gerald Loacker wrote:
> This patch set adds additional functionality to the sitronix,st7789v
> driver.
> 
> Patches 1,3 and 4 propagate useful flags to the drm subsystem.
> Patch 2 adds the orientation property.

If there are no objections, patches 1-4 and 6 could be applied from our
point of view. Or should we spin a v2?

> Patch 5 parses the device tree for a panel-timing and makes it possible to
>   override the default timing.
> Patches 6 and 7 add the new properties to the dt-bindings.

Parsing the timing from the device tree (patches 5 and 7) can be
ignored, we'll come up with a different approach.

Best regards,
Michael

> 
> Gerald Loacker (4):
>   drm/panel: sitronix-st7789v: propagate h/v-sync polarity
>   drm/panel: sitronix-st7789v: add bus_flags to connector
>   drm/panel: sitronix-st7789v: parse device tree to override timing mode
>   dt-bindings: display: add panel-timing property to sitronix,st7789v
> 
> Michael Riesch (3):
>   drm/panel: sitronix-st7789v: propagate RGB666 format
>   drm/panel: sitronix-st7789v: add panel orientation support
>   dt-bindings: display: add rotation property to sitronix,st7789v
> 
>  .../display/panel/sitronix,st7789v.yaml       |  19 ++
>  .../gpu/drm/panel/panel-sitronix-st7789v.c    | 204 +++++++++++++++---
>  2 files changed, 191 insertions(+), 32 deletions(-)
> 
