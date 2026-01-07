Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE92ACFCC5B
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DF810E55F;
	Wed,  7 Jan 2026 09:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="mVs2lrab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazolkn19012063.outbound.protection.outlook.com [52.103.43.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2906610E099
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 05:27:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzuE90VOP4y0op25fXk9v4vGUx0KG8YW8OVCQzd78WyO8cFDA8OVlo6dj4VJk6XBffgLPhN4t/vX+JBYfuiOCiqzA+X7gFATLEtpJKyH3ZWxkKqU666jRONY6AN4yLyc7arE9BXaFnXsYT/CDV+8PFak46w7s4gyj9WhDYJYv596nP/Tw6xLEy3ToDhFy+yrrHkUscNK878Tsxy7A8h8T3Ty42Qh4frxPDdzStO8Iq6RmMmG5tpmBc3L31zfiKHwdF90SogvQ2pt3JCyVd1Xf64rua4OxcpHG4iR1ujT4+zerd2qdoUznPxOdnNX7cVbzHhG2eKELxfbAvCPvjUqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uk4XKAUPuuq+/t7eD56aqVBHar2SwMvYAZgTtaB8Ys8=;
 b=pZ0VYmAy2zpvR6/HPfHbp46IMBKV2p/090aol9eOuGPKgtszIHXMaBxV3matdFpO3CFc0jdWx9GLED3r7zk4HmDdfTabm5WJGIGOsSK3AZuik5QQME1x4VVvymQHdDcVxDX1aj8xDbA22d1/90cIkMw9CrBIW9Q13tHgblJgdDQVA9GuFLVtsQRtwTtgck6c+WAY1GTMI+rRLmZFMmCaNX1KgK3LqaMhgxNzSPD/+7CnYTsP1lE+mqWJ1YtQoCCzDNUywTZI12aYG0DjchoU5ikZxRBhTn58ssIdxO7rqkBG22ArpuYh3vCRlN1V2VSj/phyWu6xnKwLrI7SxcpYQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uk4XKAUPuuq+/t7eD56aqVBHar2SwMvYAZgTtaB8Ys8=;
 b=mVs2lrabBZgdx6+bXFCX1uehOdPZ1myx3R7FwV2o+Asdqo8miCdvuDh6fNxe7KZyWaUOYrNAHkoeXudcRlfKRlM9PJlJB3E2x5j2oZQQ+1/peXxQR137eBFKr6T73KjfUAbLkvbh6mTe1lWVd7GuQZGwFRoCeGMaENd22PTOhh6WM6EjCfq7/a+DExg+cYTuPrWBOwh3HQR1KbtRiZMfx6ML22ThP7VIkboFhoYyZHCVl3Fh1P+QHMo3gDklIbsNygouLc2fNqS8XS8/7h1m+8FtlimfJe/y5zbbwAt7E6IWWlZedw/iJWxh5/rmr/2nlOOuMCOljcVaT5/DOLWm2A==
Received: from KL1PR03MB8800.apcprd03.prod.outlook.com (2603:1096:820:142::5)
 by KUZPR03MB9358.apcprd03.prod.outlook.com (2603:1096:d10:2d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 05:27:21 +0000
Received: from KL1PR03MB8800.apcprd03.prod.outlook.com
 ([fe80::95dd:dd8:3bbf:2c16]) by KL1PR03MB8800.apcprd03.prod.outlook.com
 ([fe80::95dd:dd8:3bbf:2c16%6]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 05:27:21 +0000
From: "WangzXD0325@outlook.com" <WangzXD0325@outlook.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [BUG] WARNING in drm_prime_destroy_file_private() leading to
 panic_on_warn (6.18.0)
Thread-Topic: [BUG] WARNING in drm_prime_destroy_file_private() leading to
 panic_on_warn (6.18.0)
Thread-Index: AQHcf5VZElfI7Xcb6UKZfEObxjjJig==
Date: Wed, 7 Jan 2026 05:27:21 +0000
Message-ID: <KL1PR03MB8800F1479B619EDAA37B6605A184A@KL1PR03MB8800.apcprd03.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB8800:EE_|KUZPR03MB9358:EE_
x-ms-office365-filtering-correlation-id: dc20daa0-600c-4d53-aca6-08de4dad6e77
x-ms-exchange-slblob-mailprops: xgbIMsDSu2YQP4YTVSfAdmvv3RzbJgGlPHsq77PUAFij+TFt5Z9DkXBFOoUy4cSOWg4S7H8u2wp0b4rr74taQTct3y0sT/rvYzWjpQc6/CAxxz6ySz3UNxBgwtFFO+TI7bgOx1ctC2ARYxU5/unGW/S2G5XqXMrY51k8UlypbbsXKoKdRSXxcEqZA93OyP1feQHIrTP8dA3soHN0FX4JtQuz/LsF3wxaz1E/LZTL2FkHpAhXSNnIpUIqMBLahjSN1lgwPyBj9VOyB97oQHY8lxGcr+WSAdXzv6vuRQNzqFJd7z8JCFdpUxW6FItmqMJHig/N0rnU+TFr/P7/MUAlvjJD83b3aaEA3qE7FemJ4Iry+T7P3NOZyKOLkrNqpfpnhfksw1yhcRSjJ8LFbNhBQVB3Z1yg8AuXGqYH8vnKiJfceESNnna5jYCLxgGyPJKNByOTyozay7lCaBVgnoarlSCkJ/V9Pba0WGKjWowSerV5VCIFl7btVsjVh3ivTntXYScbPWqDtpgNf4expt4uUdULXMyfG6pnXy2FG8kNzgHpLpxiuclPGrhW9xrEGs21OzJ8Mq/CaYLwe3lAL21ctAafPyJHurlv6TleDxPJtU29iEZRHIEotZUEUTl6SBr0oAS2+0J7avIQQEN5++mBOYqZgrDpaLwUwhup/DHHy25n8ig3XDVuOO2N/yBaIZwpyX3va4ZqLEUStNRzXCHlC2U254x2DjmqTmxDIJq/a13rTv3oUAYsfcQ/uonJFz0BIkgSARYxxrKErKJx6RcZTEc+d6dnUI4s
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599012|8060799015|19110799012|461199028|31061999003|15080799012|15030799006|3412199025|440099028|40105399003|53005399003|102099032|3430499032|12091999003|26104999006;
x-microsoft-antispam-message-info: =?gb2312?B?YTJmQmZOUFdoa05aSWRwLzFPcUhiQ3plNGluSkNJNmY5K0xXaElMeUZPSTZ0?=
 =?gb2312?B?SENwMDJlc1VhNnQ0cTF5MHgwaWZtam9tZ0Rwa1laRU9TMHRPOVBNZll2SmxD?=
 =?gb2312?B?ang0TWxEZTFIQlppcFhBbkdkM0g4TnpEOFRrakYzaVczbGNRa1lURkdWRUEw?=
 =?gb2312?B?b2lJY1VvMTZkd3JWZ3FBOFNCeHE4elFjOFVmSlorL1l2MmNwd3RSNml5Uk90?=
 =?gb2312?B?N1lTOUt6SkhCdjEvT1pzSUxvTnlCd0xPU1ZkSHhyNnI5OU9uYml1RlVmemtB?=
 =?gb2312?B?Zmk3cDNJMFVNM1lDWEJYdk1Bdmh0QzhIS0J5NXdwMjJrUFdxWGZEcHNyeW95?=
 =?gb2312?B?RDYrYnhiUXBnN3BzdldkbjVOUk5MK0dSaEJTVkNXT0JLRDhvSDBJeFZGUDl3?=
 =?gb2312?B?aUR0b3BoQ0ZWSHJmWWNuSUgyaU45NkRHb2FPN21zbi9oSHNoRklndFR5MnFV?=
 =?gb2312?B?VFVRczFQYmFmQ2dHcjE3VkhmcUZ2QlAwZGRZODRlVHR2M253VDA1cmFncXBT?=
 =?gb2312?B?c0dYSXZaNnpnWXlvUklXVXN2QjdHMElCL1lQQ2JyOUZCYklMYVgvYnBtbmF2?=
 =?gb2312?B?UFpmU1dxSlNnQWpzS2dzZ05xSW9mUDZKL0FZQjh4WHNWc3hkWWQ2U0V0NWtY?=
 =?gb2312?B?ZklDZk0vYXhmY2Y4eGhwVVRPem1iQ01uRkZkR1pJc3VhNWdxQlI2NkJnckpR?=
 =?gb2312?B?RGtaV2VLZmYwMktNY1VqdW91YmVnRDBXTlovb2dsWnI4a29LL2V2ODdPYm4y?=
 =?gb2312?B?V1VHT0kxNStMVC9yUUwvYkpmbHJxSmFxNGUwYzlKelV1MmtZTjUrQzgvbTBD?=
 =?gb2312?B?c1plaEJsNlBwejBQUHF0Nk5BcmE1bDY4ZHVBZEdOMXZHZGNRbWwyaUQ5bXd1?=
 =?gb2312?B?TE16U0ZvSk85bkhzZGNOT2NxQW43dlZvMHFwajZFTmFQY2hLRy9iTy9udVpT?=
 =?gb2312?B?RE9vdVJEeElaMXpxc0Q2V1UranhTZ1VSQ3h6ZWNCMEdmZ25wQ011cFVZZ0xQ?=
 =?gb2312?B?dVMxSys3UURvRlJ6bUFlNzJaWkRoSHRWUDNFb3JJYVl3czR2WjkvR3R2akpm?=
 =?gb2312?B?SnFsUHV4M1ZGRlJycTcvYWhia1RybkVtVTlWNnlNbUFtVm1DT0dDb2YvaVVm?=
 =?gb2312?B?bHM2a0pLTUJpV2xZRnkyTTlBRGUzSGtFWnNEYmVWR0lPUWtNcTJ0dDNLOXhr?=
 =?gb2312?B?RnRZenZYRlpvOUQvdnpkdmZnZlVyc0JrcmtJaFpFQXNPZnlnSmxhWHlVODJw?=
 =?gb2312?B?bGdPaUdnQjI2RnlIQnp4K1R1Q1M2eE94ZS95RWkxZG9zanlGaHI0V200aEJz?=
 =?gb2312?B?TEI3eFIrMDdIV0h6L0JtY2FoVkNLck10UnlqOHNiWVNvbGJhRG1CVFk5Z3NB?=
 =?gb2312?B?bkhIdHZMemliMC9NOFpzS1RPYlZJTUgvTEZnWElpOHpwWGZVWG0xTmkrNXcr?=
 =?gb2312?B?ZnNrbVNlc0poNnVMSHM5REFsamVYNng4cE9MNEhjbjJObDlUUXQ5ZGpFS2hz?=
 =?gb2312?B?dEpJU09MWmZxSjVpQ1pJK2xzSk5sbDR4SDZMbnNZS29ydkZGc3ZWS0FRZjk0?=
 =?gb2312?B?RWFRMXZSZ0I5Wms3ellyMWZYUlByQ3VSUEdCaHJTTms3OVlJbmcvZm1qT3B3?=
 =?gb2312?B?RzlPaEFWK0dRZEM2aFBGSXJtViszZUp3QVV5NTZnOFBValNKS1JocUxML2VX?=
 =?gb2312?B?TmEwYVdlN3lnODY0WnNBTlpkKy94WVV1V3JjWjJqWnBSTGlKd015bDB3PT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?L2RoSG9MYzl5dEZXalpuemFUVHlTSUdRR2pBM1BOSTlYYS8valArak9kYVBT?=
 =?gb2312?B?TVFKVk9BNFhIL1hIWkFHb2E0V2xURDBrZjR5YzlvVlowK1pObnB1RFFRbFph?=
 =?gb2312?B?bHdadENqdFFMY08xdTMwQ0Q0RnMzb3FxMThwU1BpODVFSk1lK3paUjg0WXc1?=
 =?gb2312?B?VkMxMmN4Mlh6NlRvSkhQVlU5NlYwYi8wKzR2YzJSZkVCZHI1UnpQSW1HOXJC?=
 =?gb2312?B?dDR3NTdsLzRrdytDbXhnd3A1K2Y3RG5EdityZXIzUG5jM1pNMU9zbjRtcHhX?=
 =?gb2312?B?N0NwdnVPVGNId0RGMVBvUVRMMDdlQXFOZnl6Ujlyc2s4ZVZ4UU1GRHdxM3U4?=
 =?gb2312?B?Um5qdTRGcVhkVmhNSVdzb2Y4b0ZSRE9TVkFvV3ZIL2NaZkdoRjRXaXd3Y1Ew?=
 =?gb2312?B?TWhWOFhEdHVJcm5TalNjUDVaRy9ocXZiRWxxMUJTT1Q3Uk1YZkdzMEg1YUdq?=
 =?gb2312?B?NXd2bktUR05oekx5dGk4Y3JkTFlnQ0pCbUpTNlRIYTZ3WXJJYTRBUHBhVTRn?=
 =?gb2312?B?M015blpIbjNVdXQ1cGFoS25aTWZSNWZvem5ySTc2ejkxWGdESEs1ZURmbTBS?=
 =?gb2312?B?WG9icWRDa2J5UWJ3T25HVTExYk5EU0tSQ2hZaXd4eXRqWjBWWHF6aGFJd1VD?=
 =?gb2312?B?VmJ3dW83SnRpY2RLSUczelFueVBaWkI0U3RSOFp3NVp0R215dllMMm9YMks4?=
 =?gb2312?B?ZWtJdmVqWTM4SGJVcVZ6cXdLN1pSWlJrZ3ltZjF4MG5oUXNjV1NsS2VQSnA3?=
 =?gb2312?B?OUh0bTFmSmxUZjBLVEl5ek9ReVdUUWo3aDZtaWd4WE1iSzNJMHpIWHh1dlRO?=
 =?gb2312?B?R3A4djZTb0w1NTJkbXZ4Zk5kcGxIbmhiR2k3UzVrcTF0ajAzb3ZtS3lLclVw?=
 =?gb2312?B?UjA1eDFPS2hMMnVWL20xem9Ea0pDUFNNcjh2R0VqTDc5SDdjUVg4aEJ2QUlT?=
 =?gb2312?B?S3NUNDBzMGtsWlJtdzZLWGpaUDg2SHJTVXlKak1YREVGM21uanUxQUlHTExh?=
 =?gb2312?B?NFExeHFrK3lBY2Vua0VIVjR0NzFiQy9XL1J5QjI4cEFzVTlWeGN2TlFkRnZK?=
 =?gb2312?B?U1lRdHBYbXFYalBmWW1WT003MGpLd0xIeGluYlU2TDRDVmpsYUFGeHJwbThP?=
 =?gb2312?B?QnRBR3VFVmlZUzVEaEkzbGZUQkEyWEFXY004TWdwL0hTN3V5V05vdmpDUGk5?=
 =?gb2312?B?bHQ5bnlUaURBTUFURjNRUU5Ca3ZpMzJ0ZGZQbUZNcGp3bE90MVk5S3ZpeDI4?=
 =?gb2312?B?Ni9RSDN2MURudlFuemp1Y202RXpFNW5JWHlVNGZYVHhjTmpHNDhUcllUSFZ3?=
 =?gb2312?B?ckFvUW1KZXFwajRrenBFM2ZMbGVDZGx0K1oyTjdodHJ6YjhkS2hkRFR1VkFL?=
 =?gb2312?B?YlZyc0c4YjlCNXJkcVNuMEVYZmoxcnJQUk1Bdm84Z0xweEFqa25SYzg5VlJ3?=
 =?gb2312?B?Vzc2VjVVOE5pSUtMQXV3Zm5SQlVsOTQ4WnduV1ZLQVgyK3lpaldjUEN6Y2tN?=
 =?gb2312?B?Z2RnWnVrbmQ4Wmg4YXJhRTlzbUdBeWdjMGpKYy9RY2laemVKOWJ6NWJaZysy?=
 =?gb2312?B?bnZqTHlOOXMxUjlrOUs5Y0xyNFB6TVFGb1pKQW1xMmJTakhUVTdENE1Qdmts?=
 =?gb2312?B?ajNRMU5CRStPemJ2cy9aU2IxZFg4aHlJVDY0dTZ0YW4rR3JOM3JmSUpKVWFQ?=
 =?gb2312?B?MFlJdVNOempDLzRTYmRwNmZ4dUxqMWFzUGU4c3V2OE1BVzJsVTM4bHlXbzh5?=
 =?gb2312?B?ZjVEays0Z1FUYTlBSjdqdTZJb3UxYWlwbDZ3RHRDUm8zTFJyYWhpVFM1UzZO?=
 =?gb2312?B?bHlYb2hFbWRnQnAvd0RRYUVRbEd4eStrdkZMa3piakxsK2VJMlNQenoyeExB?=
 =?gb2312?Q?anb4ov8454bWV?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB8800.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: dc20daa0-600c-4d53-aca6-08de4dad6e77
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 05:27:21.0186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9358
X-Mailman-Approved-At: Wed, 07 Jan 2026 09:14:13 +0000
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

SGVsbG8sCkkgYW0gcmVwb3J0aW5nIGEgV0FSTl9PTigpIHRyaWdnZXJlZCBpbiBkcm1fcHJpbWVf
ZGVzdHJveV9maWxlX3ByaXZhdGUoKSwKd2hpY2ggbGVhZHMgdG8gYSBrZXJuZWwgcGFuaWMgd2hl
biBwYW5pY19vbl93YXJuIGlzIGVuYWJsZWQuIFRoZSBpc3N1ZQp3YXMgb2JzZXJ2ZWQgZHVyaW5n
IHN5emthbGxlci1zdHlsZSBmdXp6IHRlc3RpbmcuCgo9PT0gU3VtbWFyeSA9PT0KVGhlIGtlcm5l
bCB0cmlnZ2VycyBhIFdBUk5JTkcgYXQ6CmRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYzoyMjMK
ZHJtX3ByaW1lX2Rlc3Ryb3lfZmlsZV9wcml2YXRlKCkKZHVyaW5nIERSTSBmaWxlIGNsZWFudXAu
IFdpdGggcGFuaWNfb25fd2FybiBlbmFibGVkLCB0aGlzIHJlc3VsdHMgaW4gYQprZXJuZWwgcGFu
aWMuClRoZSB3YXJuaW5nIGlzIGhpdCB3aGlsZSBjbG9zaW5nIGEgRFJNIGZpbGUgZGVzY3JpcHRv
ciBmcm9tIHVzZXJzcGFjZS4KCj09PSBFbnZpcm9ubWVudCA9PT0KS2VybmVsOiA2LjE4LjAgKGxv
Y2FsbHkgYnVpbHQpCkNvbmZpZzogUFJFRU1QVChmdWxsKSwgcGFuaWNfb25fd2Fybj0xCkFyY2g6
IHg4Nl82NApIYXJkd2FyZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCkKV29ya2xv
YWQ6IHN5ei1leGVjdXRvciAoZnV6emluZykKCj09PSBUcmlnZ2VyaW5nIGNvbnRleHQgPT09ClRo
ZSB3YXJuaW5nIGlzIHRyaWdnZXJlZCBpbiBwcm9jZXNzIGNvbnRleHQgZHVyaW5nIGZpbGUgcmVs
ZWFzZToKZHJtX2ZpbGVfZnJlZQpkcm1fY2xvc2VfaGVscGVyCmRybV9yZWxlYXNlCl9fZnB1dAp0
YXNrX3dvcmtfcnVuCmV4aXRfdG9fdXNlcl9tb2RlX2xvb3AKVGhlIHVzZXJzcGFjZSBwcm9jZXNz
IGlzIGEgc3l6a2FsbGVyIGV4ZWN1dG9yIChzeXouMC42NDYwKS4KCj09PSBXYXJuaW5nIGRldGFp
bHMgPT09ClRoZSBrZXJuZWwgcmVwb3J0czoKV0FSTklORzogQ1BVOiAzIFBJRDogMjg0MzAgYXQg
ZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jOjIyMwpkcm1fcHJpbWVfZGVzdHJveV9maWxlX3By
aXZhdGUrMHg0My8weDYwClJJUCBwb2ludHMgZGlyZWN0bHkgYXQgZHJtX3ByaW1lX2Rlc3Ryb3lf
ZmlsZV9wcml2YXRlKCk6ClJJUDogMDAxMDpkcm1fcHJpbWVfZGVzdHJveV9maWxlX3ByaXZhdGUr
MHg0My8weDYwClRoZSB3YXJuaW5nIGlzIGZvbGxvd2VkIGJ5IGEgcGFuaWMgZHVlIHRvIHBhbmlj
X29uX3dhcm4gYmVpbmcgc2V0LgoKPT09IENhbGwgdHJhY2UgPT09CmRybV9wcmltZV9kZXN0cm95
X2ZpbGVfcHJpdmF0ZQpkcm1fZmlsZV9mcmVlLnBhcnQuMApkcm1fY2xvc2VfaGVscGVyCmRybV9y
ZWxlYXNlCl9fZnB1dAp0YXNrX3dvcmtfcnVuCmV4aXRfdG9fdXNlcl9tb2RlX2xvb3AKZG9fc3lz
Y2FsbF82NAplbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUKCj09PSBPYnNlcnZhdGlvbnMg
PT09ClRoZSB3YXJuaW5nIGFwcGVhcnMgdG8gYmUgdHJpZ2dlcmVkIGR1cmluZyBjbGVhbnVwIG9m
IERSTSBQUklNRS1yZWxhdGVkCmZpbGUtcHJpdmF0ZSBkYXRhLgpUaGlzIHN1Z2dlc3RzIGFuIHVu
ZXhwZWN0ZWQgc3RhdGUgZHVyaW5nIHRlYXJkb3duLCBzdWNoIGFzOgpkb3VibGUgZGVzdHJ1Y3Rp
b24sCm1pc3NpbmcgaW5pdGlhbGl6YXRpb24sIG9yCmluY29uc2lzdGVudCBsaWZldGltZSBoYW5k
bGluZyBvZiBQUklNRSBmaWxlLXByaXZhdGUgc3RydWN0dXJlcy4KVGhlIGlzc3VlIGlzIHRyaWdn
ZXJlZCByZWxpYWJseSBlbm91Z2ggZm9yIHN5emthbGxlciB0byBkZXRlY3QgaXQsIGJ1dApubyBt
aW5pbWFsIHN0YW5kYWxvbmUgcmVwcm9kdWNlciBpcyBjdXJyZW50bHkgYXZhaWxhYmxlLgoKPT09
IFJlcHJvZHVjZXIgPT09Ck5vIHN0YW5kYWxvbmUgcmVwcm9kdWNlciBpcyBhdmFpbGFibGUuClRo
ZSBpc3N1ZSB3YXMgb2JzZXJ2ZWQgZHVyaW5nIHN5emthbGxlci1zdHlsZSBmdXp6aW5nLgoKPT09
IEV4cGVjdGVkIGJlaGF2aW9yID09PQpDbG9zaW5nIGEgRFJNIGZpbGUgZGVzY3JpcHRvciBzaG91
bGQgbm90IHRyaWdnZXIgV0FSTl9PTigpLCBldmVuIGlmIHRoZQp1c2Vyc3BhY2UgdXNhZ2UgcGF0
dGVybiBpcyBtYWxmb3JtZWQuCgo9PT0gQWN0dWFsIGJlaGF2aW9yID09PQpBIFdBUk5fT04oKSBp
cyB0cmlnZ2VyZWQgaW4gZHJtX3ByaW1lX2Rlc3Ryb3lfZmlsZV9wcml2YXRlKCksIGFuZCB0aGUK
a2VybmVsIHBhbmljcyB3aGVuIHBhbmljX29uX3dhcm4gaXMgZW5hYmxlZC4KCj09PSBOb3RlcyA9
PT0KSWYgYWRkaXRpb25hbCBsb2dzLCBmdWxsIGtlcm5lbCBjb25maWd1cmF0aW9uLCBvciBmdXJ0
aGVyIHRyYWNlcyB3b3VsZApiZSBoZWxwZnVsLCBJIGFtIGhhcHB5IHRvIHByb3ZpZGUgdGhlbS4K
VGhhbmtzIGZvciB5b3VyIHRpbWUuCgpSZXBvcnRlZC1ieToKWmhpIFdhbmcK
