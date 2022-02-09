Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D74AF5B0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FD410E2A0;
	Wed,  9 Feb 2022 15:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60044.outbound.protection.outlook.com [40.107.6.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7D210E2A0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW1OBEbLbWIPLxa4Q9C1fs3r9ob9XTe+RQ+F4Vek34YmfPVX5wUGqZCWp1TJkwSShT28qukFeIcndRD7+SxefxVhuFgp5ljXK6uz7dfmyZh2a9yYBUNipJdVnXe+HLRqFb9g7oeoV60fcjdmvS5KvSDGiQXH7Z6xD2GtuNBzamnURI2aY4wSrUn3HFznKgAJ/8kKm57HnImFKSQztcOv8q2l2/OxZbzbIBaahiB47vi+Joz4SNYDBBzJR96c/1HmMSTNmlNdGsdHl2+bxtFrn+eXCdYFDyFTa9+/l/CZsgBmlu75HzX8sRsaEpdlIT0vDTu1l4FGqMU/ADVUb1El2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtlXlYYQjxc4Fso6Exv7WJdMfYM6dIaovu4dInEN6wI=;
 b=bXp+X277i/aFlzKKKoDBy3B8tBwTtu2h+azZQHjAaaoJs3hfy9UGnk/aQillhta76Lv9TVOTVQFnFWfxmB5zZl8OW9I1D+6ASJQmpJr9ViMcs3xX2qQE5MUBihliWDN1sOYYR4Fv6gz7+nSivmpkI9qUm3gWhDPSPUd9uWDLvUGYnhSuqSmM6124XBVFjG3kiNvmcnGkNC8WtXZztkJcrvxrBxa2VwfRiDKVtFyZyDPOHzlp4i7YwYZQCdS7zYb30q38QI9K9KueXZF6ci2PR356Fu4p0uil/geyD80aGgRl7M9CpnsU/8NDxd3qQ7u3qGTVS/TkRx8FuFXbJ46/zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtlXlYYQjxc4Fso6Exv7WJdMfYM6dIaovu4dInEN6wI=;
 b=arZYbsSsS7XO0Fi6QCCnXRvRDmVDZ7zzi6PlvrZWS4v7LRMvP0OUDkyAzciI4KZcKhK44Tk7dy9ymM7mzFJ6tsfgJSAIfDsvHubU9AVf18l4v65UGujz+L+5wi6XXUkLJsjO6sT6c68XeAMHETpEYXH6rr9UVt132KsZ84tH3NA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by VI1PR0802MB2160.eurprd08.prod.outlook.com (2603:10a6:800:9b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 15:46:31 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 15:46:30 +0000
Message-ID: <01b78d95-fdf3-060a-831d-dae2abbc7109@wolfvision.net>
Date: Wed, 9 Feb 2022 16:46:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 1/5] dt-bindings: gpu: mali-bifrost: describe clocks
 for the rk356x gpu
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220209085110.3588035-1-michael.riesch@wolfvision.net>
 <20220209085110.3588035-2-michael.riesch@wolfvision.net>
 <1644420908.380944.391811.nullmailer@robh.at.kernel.org>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <1644420908.380944.391811.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0045.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::14) To HE1PR0802MB2426.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d80a2475-0211-45e1-3070-08d9ebe35754
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2160:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB216074FA670C666B9775D9E1F22E9@VI1PR0802MB2160.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJyLcg/KC9QFwL64O8qjSdnuoZeoKmBPTsHiU0VKAvgmqQWwpKKK9NfnsCqpOFKBLHwh39bWoUjUGmSRA7nu3slo01OMbQMqY0nIGroQ1C6r5QhRdsX8LPIkIsth+6SUIAYcj58PlJUiQpKTLXgKRkZgOjn5111lpjJNXtyp3zH0v7LqUnqyH7DJispaUztyPvaamvksqmC9GTQZ41bOIPzaQ49iYUE8Ef3H+BdqTlvvrBaTHxLPuBIuy0MZ9OMtHOONDBNgmu7z1idTmHqSnBiGnz0/BABs0ozNK5NsMFA/rZweyx8+2Ezh9A6QlKN/j13xAw8EPvBb2+xygEpJmdiZX8pbGLc9lYFdGVJoY1XEE2ctdHaNn1PpB+yXB3JMgHMMwoV6C+r1jbcmXIzPBgiCcQM4GU0hWXcaUYrKgMhdWPu8CIWEh5Xg/+Ue0P/OR1KZlc/L5xAq8/AturfNTViHqs+rXEi8mjIWG7mgJDiMys7SKmlfISJNYnh4CTjB47lBYjMibOWgJ75QOb/bYM/5ETMqf4Y1Kp2i36v7DwaUUZEak/K39bTYZ8FRbxR+drJeAf6ijPitZHQqpO5Ty2IBfKCnTvl66IimLr0LGutCzTsbZTw1iXHD6aahwwiMvu2bFpLGbIuQoCJsOAE8aFEhgnZnqqiaXRAH1q6Bdbp6bNftiDAZwhxgvWP2YIFj6hbhja3A3V7qqARxTCkI0433Q9VCd7nl17eGebV6botC2YLwzj5JfC+QIrCJPuYj/bHO67pc8RV+xVo4F/41ybM6rBGCmFKpBqfrKCmFsYa1m7voMRwV2vNIwbkbN5nh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(38100700002)(66476007)(4326008)(8936002)(53546011)(508600001)(966005)(66946007)(6486002)(66556008)(8676002)(2906002)(54906003)(86362001)(36756003)(52116002)(83380400001)(2616005)(6916009)(44832011)(186003)(7416002)(6512007)(31696002)(5660300002)(316002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXZyWW40RmV0bEtWanRPOG1wWXVmTmt3S05tSjZsMDNwMTZlTFFTdzJuWlJx?=
 =?utf-8?B?ZE1zNXdxYmU1SmhiZWpGYXhqeXZCZnZTbTN4SkF1Tlo0TnZlYXgzV1JRc0FB?=
 =?utf-8?B?YVVYamhrU0JSa2ZOYklBdjlTSGNFL2JEbnhBaW5xTHE4ZlI4bnVWZFphdVlS?=
 =?utf-8?B?UDhZbkFCcW1CUXU1SFV1SkZmT3FNLzhSbDd1L2tmSk5yZDZtTU05enlpM1dS?=
 =?utf-8?B?akFtWWhoeGZKOUt6d2FITURtNnh0a0VYWmZhQ1k5OWsrNHEvaHFHQ1E5RjRI?=
 =?utf-8?B?WVQ4Y2hka3htUWptR1ZCdGFVNTRQMXVHdFhuT1VLckNFUHhqUElMU3VMRER4?=
 =?utf-8?B?Z2lLK0cyenhQMVY2UjY3ZFRrVHZlUVdnZUFTbHB3cEZDUTQrUEExVnJYa2VO?=
 =?utf-8?B?T2VseUdrUVZXSHJZdVlzU1BqNmw5SGdWc0JONXllRmN0ZlZmTm1LdWEzbU1I?=
 =?utf-8?B?Sm5hK3FTT2R1aVZTcjRIREtDa0dRRnZpK3h5eEpkaDFkWmJESSsySmlyaDRB?=
 =?utf-8?B?QzB1eDNqb3J2RXpQdWxzVXJDTmFLdEp3MThBRkxQUE9aQnhuL3JvbUNtL1Fi?=
 =?utf-8?B?TkcvYkRwLzd1eUJVRjBmbjZDeGtTZ1ZCazRtUHlEMktvVW1tVHpyTkM1VnhN?=
 =?utf-8?B?cGVMNlpFTW5MZTBXUFdwa1hGaGlVcGZHYjYrUFJYRXhwdGxjLzFhSkhpUXpp?=
 =?utf-8?B?R2FZZm9IbmNuNG1yZDBJemNobytpU0hnNHdMcTkwQnI3NXRleWRVS2d1TTNv?=
 =?utf-8?B?U0huTE1Talc1N3drMDQ1dzhQSzQwRzB5bjYrSmszQUo0ZEpMUmNGcFQxM2tX?=
 =?utf-8?B?WktXU2ZERGw1dWtPa01LRkZnU0ZxM2hJTzNEb09SYXdjUTRTZWtKYk9MSmNV?=
 =?utf-8?B?WHpWUFVPR0kyWkhPRFVBdXBOb0FPSXJiQ21ucitTV1Faa1BVdExleGdQVVBO?=
 =?utf-8?B?YjJnVkhsaXg2L1kzbGxoRHQ0b0w3a0dXUTlGYnBqSDNRSzhFZjl1bGxpbldV?=
 =?utf-8?B?QkFNTXlyOTU1L2d5V2NkWW45U1lqbU9Jbk0zRG9uaVBPSVFnTVRsMExQY2hM?=
 =?utf-8?B?SU44bi9STkJGL3F3SjBLbG9VL3hVSWdzUlhWM2QrcllXOFFra1Z5dXA0b1Zw?=
 =?utf-8?B?RUd2UWswRmliSGkrQ1NIek1OazY0emNwNGJXVFF6UjhQVXZwenpsV1UrL29D?=
 =?utf-8?B?VHFtQzV5TkdPRnZlcm5hQy8wRWZ0b3I1WVdBZ1pVQXNnT0gwdGJIYllYUE0z?=
 =?utf-8?B?KzhrRUR6MFFUOTZpRVVZVHdmUmNBYXZTOWgva1BDd2R5dmhuQVBYWFZJbFdF?=
 =?utf-8?B?RGg3RUcwMjhIaEtHOVVyd25WZzZBZXVXdlc1eFlaUWRXckRBbW05K0ZxWi9V?=
 =?utf-8?B?V2c5NVQ0RkVpNWpoT2JLS1h6U0pjY1hXdHloNFZYWjcxN0RBSlZPQUZlMkFp?=
 =?utf-8?B?ajk4eGQ3bWgyclhlZmVsNHgxYk9BSXE2aS9JcmpFMVZFTjlxT01wSENrWUMw?=
 =?utf-8?B?WEMxQ1pUdm9EeGhRcDJ2UXpsMGtYVVlVVm1VTnVrQXlpTit1SXhJQit4SkYr?=
 =?utf-8?B?Ung5UVNEdm1MbFowazF4V2tmNEhEN1lHenhwTzlHRW5pYU05V045cE4yc0VV?=
 =?utf-8?B?OHdzTUxvUTRUL1puMDFNWGhIMXRHRDlySE4yRHpMcFVzMVRQUHJxODRCNE9x?=
 =?utf-8?B?aU5oNmVNR2FXMTNQdnpMaUIrWjRYQkdvZ1h2MEJvRy90Slc4OS9LQW9CeG1j?=
 =?utf-8?B?SHFPSEc1RzRBRjFFWlhQbWhwNjVKdzE5N0JSdVlzVzBFbUxUaFkxRXUzSWVE?=
 =?utf-8?B?enNPV2pMTi96S0s2MkFpSlhnbmdBamtjRHlybU01dmZrcjlvalkyWjJud2RK?=
 =?utf-8?B?eHVma1F3aFhxVXZlbGFxVmNsanJvU2oyK0xkcHI4ZEVZTWxRR05xbVYyZHVy?=
 =?utf-8?B?NXdvMTZwc2VqOVBtTGVJU3dQanY5UDdVbGdKcHpGUVdxVFYwVzFKWXo1bC9V?=
 =?utf-8?B?YjVCVnErbjE1VkR1QjJRZm1mNjd2TWR5V3M2S1RRYmd3NWplMmFsbGR1SGhh?=
 =?utf-8?B?YUN6WUJGQ2psNC9kL1ZBeTRFMDRzTGNyUlFTRXhkenRUa2NjTzZEZFAwSEhI?=
 =?utf-8?B?SGRTeEhla1hwU0xGZHRGTlcvcUFxa2Z2WlJUT3VMaEJUUmNpT3NxU3R4aTZp?=
 =?utf-8?B?aVJNNldXN3hubDlIOEpDZDZlK1RxT3hpSzlZZjJUM3NreDJFUStMTkZIdmJV?=
 =?utf-8?B?WWhlOEJLbzRSYlVTRU01b2pLZWFIRytFNDU4dzBka1VxS1JwMW5WdG1DTFhp?=
 =?utf-8?B?NGdjaTFleUkyR3RlNWMvNGY0QVVmLzFLSXBBNVRoT1FGdnBNZnZpVHppWHJY?=
 =?utf-8?Q?kU9iVq59UgLi8+98=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d80a2475-0211-45e1-3070-08d9ebe35754
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 15:46:30.7530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iD5Isqs7TgXEZOEialdEPdobBBF1YP4NfbfUqfFg23B+YN2J8r+41QjvGd6X/moBiU5ImMEysG4DHKWM+e7DL4WUSbT6T4EXSBFrZ8Uu5TM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2160
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Peter Geis <pgwipeout@gmail.com>, Liang Chen <cl@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 2/9/22 16:35, Rob Herring wrote:
> On Wed, 09 Feb 2022 09:51:06 +0100, Michael Riesch wrote:
>> From: Alex Bee <knaerzche@gmail.com>
>>
>> The Bifrost GPU in Rockchip RK356x SoCs has a core and a bus clock.
>> Reflect this in the SoC specific part of the binding.
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> [move the changes to the SoC section]
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> ---
>>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml:173:12: [warning] wrong indentation: expected 12 but found 11 (indentation)

D'oh! Sorry for the stupid mistake, I found that yamllint was indeed
missing.

Lines 173 and 174 need an extra space. In the case that a v6 is required
I'll fix this. But of course I wouldn't say no if this could be fixed
when the patch is applied :-)

Best regards,
Michael

> 
> dtschema/dtc warnings/errors:
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1590238
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
