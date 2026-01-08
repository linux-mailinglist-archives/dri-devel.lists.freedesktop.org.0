Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6EED023C0
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 11:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732A910E6ED;
	Thu,  8 Jan 2026 10:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Z/Pp+Zlx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazolkn19013081.outbound.protection.outlook.com
 [52.103.74.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF2B10E334
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 10:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kz+VqCCH5npoYN0ttSGp43GtffR2O92ADSlLXUE02b5+QFtjjvzvbsSrO6IyUcVs0XTTWUDzmW5/BrL5I4NMzu3Otx0+j9UonhCpUfEg9v1Oo1v5nUxNA9GorvNW8mBc9nP7c2EAyL1wNBQqKtEdV+95zwWH+YepcIVHeXROe7Uo1yRFj5cfYaXc8Hg8cq0JAH43GB5pS9MkNb9YTKK3W2c2KgaYPop++CrI0rh+/jM6n8nQYUSkVxReM3dBrPzSNfG1CgjcfTeVDzAJKBNNfgfaEvfF01rNSgiypCoZwldutBeZZzLrCrOkpxVSuV1qew8bJBjoJjPFvPPCAmnkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNy+eHY7zV7qgscff2X6kfFem9sPuTkaQQBqQ0Cgz6Q=;
 b=NIuTYnnmHCseMz5tdIQXDOYJffiUaF9hNLn0wAq6ZNtJgZtvPyhfT1xyZGO6L2GTNqx9XtCrGCsKztPRz2djtQ7QvpuxEhamefvWbcFmVFkTyLP/eKlAIKqO6Uqo3suZ34EehMP+UjLgGte6UdHOf3pTi1VKc7C2vC3KFlktMNZJ2rdSPPlmONpdpnZTKL3c/aiqDh8fwXLzCHIWZsOLSHvkrq6sczdIyXRSeN8v5K/b+5ptGSiImBQAErhkQxi5UTYEFltvOkRSZYSFtleBtiuY36lZzXQE+LcLKV1/CxfTk5ZPljiFV37edls35yAILCC2GO87GjrOMz4bA90KFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNy+eHY7zV7qgscff2X6kfFem9sPuTkaQQBqQ0Cgz6Q=;
 b=Z/Pp+ZlxHN03ubLZmFcNS4B4HK07MG6zqZ6fzS/NnS0Me8p3Fzf+2RQjEdvxQ1KlcrNcKJ4m5qgBimIcGl3DWcFyW7gIy7IPuU+iKQ+a0F0M8uqbkDey593B/Yr8BO3Y5atfzH3GDVuODM4RiIxsLFaCJUlBGageazwVxW97XOxj2jQU2za6JbTw233HeLEQHaH/ssDtIqI9kVSVVK7noItTmPIOxue6RcnrBr+EgqaEkww2WTyDTzCWaAvXSd9vVp1jt39h4f7vHlBJlWhli5nmoq36C+9SyWGS+twz6E7PYkmoK2to02oxflAP/DbHqZ+ka6FJZ10y+FDw0g8Bsw==
Received: from KL1PR03MB8800.apcprd03.prod.outlook.com (2603:1096:820:142::5)
 by TY0PR03MB6823.apcprd03.prod.outlook.com (2603:1096:400:218::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 10:43:57 +0000
Received: from KL1PR03MB8800.apcprd03.prod.outlook.com
 ([fe80::95dd:dd8:3bbf:2c16]) by KL1PR03MB8800.apcprd03.prod.outlook.com
 ([fe80::95dd:dd8:3bbf:2c16%6]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 10:43:56 +0000
From: "WangzXD0325@outlook.com" <WangzXD0325@outlook.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [BUG] WARNING in drm_gem_object_handle_put_unlocked via drm_release
Thread-Topic: [BUG] WARNING in drm_gem_object_handle_put_unlocked via
 drm_release
Thread-Index: AQHcgIqbAdStzhdFXE+/ufGycUGSfg==
Date: Thu, 8 Jan 2026 10:43:56 +0000
Message-ID: <KL1PR03MB880038ED4D0899BEC73A1E24A185A@KL1PR03MB8800.apcprd03.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB8800:EE_|TY0PR03MB6823:EE_
x-ms-office365-filtering-correlation-id: 4c56ed00-7850-4f4b-5835-08de4ea2d341
x-ms-exchange-slblob-mailprops: ZpxNddEKiWwjxFydBHdiBgab8YGVqH/WkjaQrxH+3hSGp51nkC8SliBUbKwAfBl2iHmdzZiCdR3SXohNdyx+sF7qrOoP5AAYo+Qz3RKP8OOGbjfw3bWpkoobTkxtg2zRTY89AM3Le3pnOPKpntnaImFUSgFG8CFqZFb3KON5nbX4mH0NjDfCe+ynxezbF1eD0uiGpdGfpJpB9LeTYTaUHG/xO9UP6pT/BvRLn7DBjoN7GBDaThEgZT0PANdGgr+hnkCwkMcdQuBM/YhGf1Jbg4TlqukdHTv2mgULNiE/cVA2LDHIK3zBz45Q8JcnlZ5WScDN59sWzisrSGe5MuhSV3NJi93soM6Wq4xD6d518PLocEGm8J7wlFgTBh1Ki5iPu3Tl6N5JGGkyaJ6H68HUJsM2rJqLwyytC/k1Tg/a1ggUH/YAXo6yGQq68WOUXmuNu/rYOD/ttmqBs6YWnpdzp/q/n+CYLEAwOU8LvwpAS+G5NQbEs3rs8lRbE3ZuZs+qSEXedRxYv5Cf8+sf0Y1n1I8RRGgeYFZ31NKxJ+exgLqPELI7v9RFffbZuXZ8V+QvSivAZ7t2+LbSzTz2kElFbm39JOpT+sb4zfMxJlCsWC4FCV+nbjIec63npfMyE8jc4mAX2SaZcgmYS5kUsRXgl2GiKXB+gu0yYWR73CrwY77cE5M8Rd+F2TeYAg+e/x127CpBRKq7fqo0HzYeIgubuZQK6rb/mon10JPE79xZWYVQpShnoHz6nGN+UmWN7vDf1OtI1l4AVSq62Bbegv35ghIJ9CjHel/fksAWRdfjbT4oKq88bJ9cqI6ZxMby3KdjPKyuqczIjIPPC+5GgUWDsQ==
x-microsoft-antispam: BCL:0;
 ARA:14566002|31061999003|8062599012|8060799015|461199028|15080799012|15030799006|19110799012|3412199025|10035399007|440099028|52005399003|40105399003|12091999003|26104999006|102099032|3430499032;
x-microsoft-antispam-message-info: =?gb2312?B?aWsxZFB4UTY3NlBBc2NUNVFyL0Npa1VWekhBSGRMTXc0b2pTSldEWGhFeFhi?=
 =?gb2312?B?VTZSZFJJMDh6a3k4VWRDYTlKZmpZdGRJY2VjTkQvT1VNNXd3UjFDZUlzQnpr?=
 =?gb2312?B?VWJlYmNkNXQ5Qk1TSHRiNllVRG1SMzRsQTJ4Yk1TS09vSUtOKyt5TnZ2T3F1?=
 =?gb2312?B?NlcyVUFJUHNhTWRTTDdUZTV1L2dOcWJQQldITTVMeXZlZmZvRHVHcVVHMVJv?=
 =?gb2312?B?cUEvOEFrVldxcTBhempsRHdCbjR6eTQ0bmNyU3AzK0RvQXhQOHFzMkk1Zndo?=
 =?gb2312?B?S255RTJkT2Jna0VHc1BYVVlaSC9oVnJOaHBkWXQxV1BpSURaT21pNmV4UzlH?=
 =?gb2312?B?NERMYUNZdWQwNm43UWdSVXJ4WHZnWXAyZzVhUWxhaUZ0dWVrZ0xaK3NqTGcy?=
 =?gb2312?B?VXduSDBoN0l1STh0czJqL1lLd0ovMEhPelRLNCt4UXRWSHJoajdXckgzV3NI?=
 =?gb2312?B?ckFKdGhlemhCL3hVVGplYmZiaDhXSG5ZcHR1aXF1T2gyUlVGbytWNDduVElM?=
 =?gb2312?B?UTdXUU4weTlQU0dkbDVkUjloaTBFRWlmK3QxbTdUTGV6UG5ldmtMb01hWWNH?=
 =?gb2312?B?cjRxL1VsR1VuQ2VFamZlRFBBVHJjV2pEek9ldlhWa1dKVmZjOUlLMDBXM1cx?=
 =?gb2312?B?eG1KR1R5Qnc0UHNmSDNqd29qVTVRdTBHM3RtUEphR1JYa0VmbG53NmtmNXRO?=
 =?gb2312?B?VGNpVU0wVjhyeHJWekNvdk9FMjFnalBXZzJiM0JLeTZCeWtINms0SUhNNW9R?=
 =?gb2312?B?ZU9CT2pRQmIyTmlXZE9sTXI4SmFKdVpSQkZoTSs3dXVJSUVZNm1Sam1EUkYw?=
 =?gb2312?B?VVlnV1lMVmpKYi80c0xRaWIvL2FOZmo2WW1sTTdZcFVKTFdwTXJvSGRMbms2?=
 =?gb2312?B?TVhxZjRBdUszUlBWc2p5ZmV2Y3BnRUc2Q1NJVkRUTmVnZzdUL3pKa21yRm9y?=
 =?gb2312?B?ZER5ZWxHUGR0d2NJa0hQbnhLY0xzOTVkeTBnVjVpbUJyNWNVMXVVTXZNeVVF?=
 =?gb2312?B?Q3ZIeFdHVHV3V2NYNk9CTXRXVExtdng4RjlsY2F5cGtaNmxUekh6UW5pbkdy?=
 =?gb2312?B?c202K01SdFJrb2JMNGVqeU9LL3BBdUY2VWovbHVWeVVqTFhTN2xvM00yZndO?=
 =?gb2312?B?OEFHb2tRNlBBTTN2NXptQ3ZFWVBybzQrcXU1WGt5ZHJqSzhKcjN2V3hyaEt0?=
 =?gb2312?B?UTBNMjVhbzEyRHBWK2JQMS9IQWZ6UXNkSDJ0TStNZ2RvQ3FnTEZ2TlRNcHVs?=
 =?gb2312?B?dW9xNm9Jc1B1cDlYRWIxQ3QrenJZS1h4cUVReDRFVGVzK2ptWnZGaXh1aEdw?=
 =?gb2312?B?dVlCYnE4ZDEwYldFV0FrSUtKVXlRcTUvRXBGUURsMExRVkt4ejhzSm5yNXhH?=
 =?gb2312?B?a2R2VmR4bHM5RHlIakRHM2p4M3pibWZ0MjcrRlgzTnpQMDRqMzFsaU9nakR4?=
 =?gb2312?B?WUxIU3NWZjlOUSs1Q0RTRk9QdThyei9pNjR3b2lPZWVnS3hkeHQ0RXkwejNk?=
 =?gb2312?B?NG13bSsxaHRKTWM0Y1dIcWQxWVdha0d3Sko0NEowOFlkcjV0N3RFcTJ5aDQ5?=
 =?gb2312?B?aUVwNHRqWGRXMnVhZ1pvK1Y1aHpnV2Z6SlpkZURicmJZUVA0RzY0K2hteDha?=
 =?gb2312?B?OThWUEY5czJFSEk0cUg2Z3FkYmI3Y21KZjJzVDVNRUVzSlFCU2hlN1E0dVNr?=
 =?gb2312?B?WTJRcm9kdTVoR29XTENCMkdyaFFvNDUzMlFHWVJMRmN1SEEwbGlMa0hURE5F?=
 =?gb2312?Q?AzD5ulUYI5Iq7ee/gA=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?cVkwVGV1WEhISVg4K3B1M1l6ZDZYN0VFTVZuZmZtVkNYNjc4MWF0dkZSdHNU?=
 =?gb2312?B?VXZZdE5sU09OSnFjTlEydHRUaDQ4Y0ZqYWE2S0FjMlBCTGl4dmc1ME8vRElC?=
 =?gb2312?B?ZUF1UUQrS2NBL3dtdDlqbmo4aXAxWUc5SjgwRUQxQ0lZQ2FyOTY5U0d4ck5I?=
 =?gb2312?B?aDNqbUJVU1JKcTNnWmhMeUtzNGw0K2NRYk9xeHRhUWMzRFdrcWI1cFBrRE5K?=
 =?gb2312?B?aVpMUk9aRUkzbXg2QjNZRmlSbTVvQ2cwdjZaUjJNcC9QT3FrU2YzQ2lrM0F4?=
 =?gb2312?B?aGNyQm5IdFJ1VXJRM3RIY1ZmVW9TUFI4UWlpVVFVcjVrMkF4emphdUZOTTYx?=
 =?gb2312?B?OFNJM0F3YWhYNUo3QlJnY3VmcHZvUUhqQWdkOGhpV2dxMWRGQ1QreTVaYkJw?=
 =?gb2312?B?eitCUXNVRlJVeTBZZzdiUmxlUXpXOGFpTmRCS1o2OTRzcDBxWGVjQzJUaTRr?=
 =?gb2312?B?R3YrZWhuR0NwT1lYT1RUWHJtTVZlQXFNRzM2YkRUT2JkTmwyZkQvR0x6ZnY0?=
 =?gb2312?B?Zi84ZTFWZ1c5dHIxdUcyRklEUlNoOUtXTTN2Y2VpVEcxa0ljazc4YmdKTHBy?=
 =?gb2312?B?U1poNGtWNitGKzlUYlFhZ1Z5ajZPa3dIRFRDRjhEOHJiQkkva3NOWUpWMyts?=
 =?gb2312?B?a3AwZFpWOVU3RVpJcHk4QXdhajQ1VnN0ZGFzUy9oOG41SWtIdE5jajlsREht?=
 =?gb2312?B?ZjhIVW4vUDJqTlF1V01USGM4bVljVkpFaS9xdlFqMVVDUldVVmVaZ1lvZ2dR?=
 =?gb2312?B?K3pMd01IVFJGRGZaUERacUNpZjJ4eU5pYTZ2ekZSeWxjMzVPT2JHUFNyK2hM?=
 =?gb2312?B?OE55cTFVRHBoL0VKcE5MaUFmZFVaZU4ybGxIaUE0NWQ2dWhsdkJtZ1p0bU4v?=
 =?gb2312?B?dERYTXVITmw1RGxFWXJCRlE4QWllYTkzK0VvRGFxazE3ZmpTbE16TjN2R0Zu?=
 =?gb2312?B?ZkFKbmljQnpTdGxlcnNzbktBQ1NKRWIzQkxZUFhEMVUwdFhFR0RKWFVxL05C?=
 =?gb2312?B?WjJRWGFRNFloMTdGSVVra1lGWlAwVHRsdSt2b3NnUkRPQnF0OHJwNU42VkFU?=
 =?gb2312?B?ZVBTS1FOKzV6VTRoT2wxVkhCSFhpRUlOWXgzck9icHgwOURURlo1T3RnWXJl?=
 =?gb2312?B?SGl3NEdPNGVEVGgxcWFKL0hYOXNVSXlSZVZ2ajM1OEM2S2ZKdi9oS2c2cFo3?=
 =?gb2312?B?S05LOUVucWdHbUZHMkUwS0pjQ015NDAvdURTY0ZRcU5xQjRzbzM3ZStuZVFW?=
 =?gb2312?B?Q0p3Q1dTendFVFl0ejNuZUJKUWk5VTRodFdEZTNnNUlNYTN0K0hHcklNY2ps?=
 =?gb2312?B?TmRKa3I4aUNvK1NyNXRCdUE5M3FVQXNmYk50c0VTNStMZTN4cWtQbnkxWDFo?=
 =?gb2312?B?WDhUSTFTS2NjTzJPekpUNWdCNFJ2RStDdDJRaWUwVDd1V1JDZDA0ZmxjT1JB?=
 =?gb2312?B?L1FUankxWGI3WnlRTW9QUUZJcnlGMzdMcHBkZVN6Y1cvRWRLMjNLQzdvdEpO?=
 =?gb2312?B?NTd5cEpoRFQxaWw5NDRlc3grVDZXSEV4azVDaUltSFBsYjVBWmF2d2Y2aXdK?=
 =?gb2312?B?ZERycVFxNFNmNXpDUEhsSERyRTJPVjFIWUt4R2czMThpUnNrQ2RHbTBueEpt?=
 =?gb2312?B?TkptWFBhOThzaGJuUTZZY0NBZ3lhTW9wTzg3ZTJRYnRUT1hia3daeENZL0F5?=
 =?gb2312?B?RDBsSkovSjcrQmtjMWlrRlBydlV3UlpXZ3FCa1lEcmlpN2QzaW5wc3Z0ZEhH?=
 =?gb2312?B?eWNSWVQ1Y214YzBVaXhBT2lpUUJnRkgxNS96QTNkalBjMFZIMWNjYTAvU01E?=
 =?gb2312?Q?Um8EHEQAUXubZZFMx4mfmPZ6Nx2BAbdQiR+gs=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB8800.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c56ed00-7850-4f4b-5835-08de4ea2d341
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 10:43:56.8345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6823
X-Mailman-Approved-At: Thu, 08 Jan 2026 10:56:33 +0000
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

SGVsbG8gRFJNIG1haW50YWluZXJzLAoKVGhpcyBpcyBhIFdBUk5JTkcgYnVnIGRldGVjdGVkIGJ5
IHN5emthbGxlci4KCjEuIERlc2NyaXB0aW9uCkEga2VybmVsIFdBUk5JTkcgd2FzIHRyaWdnZXJl
ZCBpbiBkcm1fZ2VtX29iamVjdF9oYW5kbGVfcHV0X3VubG9ja2VkIGR1cmluZyB0aGUgY2xvc2Uo
KSBzeXNjYWxsIG9uIGEgRFJNIGZpbGUgZGVzY3JpcHRvci4gVGhlIGlzc3VlIGFwcGVhcnMgdG8g
YmUgcmVsYXRlZCB0byBHRU0gb2JqZWN0IGhhbmRsZSBtYW5hZ2VtZW50IGR1cmluZyB0aGUgcmVs
ZWFzZSBwcm9jZXNzIChkcm1fcmVsZWFzZSkuCgpBY2NvcmRpbmcgdG8gdGhlIGxvZywgdGhlIHdh
cm5pbmcgaXMgbG9jYXRlZCBhdCBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jOjMwMC4KCjIuIEVu
dmlyb25tZW50Cktlcm5lbCBCcmFuY2g6IG1haW5saW5lCktlcm5lbCBSZXZpc2lvbjogdjYuMTgg
Cktlcm5lbCBDb25maWc6IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL21hbnVhbDAvYjhmNGMxMmVh
Nzg0NjIwYjNkYjkyZGJlNTZhZmVkYmIjZmlsZS1naXN0ZmlsZTEtdHh0CkNvbXBpbGVyOiBnY2Mg
KERlYmlhbiAxMi4yLjAtMTQrZGViMTJ1MSkgMTIuMi4wCgozLiBTeXprYWxsZXIgUmVwb3J0CldB
Uk5JTkc6IENQVTogMyBQSUQ6IDQ4NjE3IGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmM6MzAw
IGRybV9nZW1fb2JqZWN0X2hhbmRsZV9wdXRfdW5sb2NrZWQrMHgzMGUvMHgzZTAKTW9kdWxlcyBs
aW5rZWQgaW46CkNQVTogMyBVSUQ6IDAgUElEOiA0ODYxNyBDb21tOiBzeXouMy4xMTYyNiBOb3Qg
dGFpbnRlZCA2LjE4LjAgIzEgUFJFRU1QVChmdWxsKSAKSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFu
ZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MgcmVsLTEuMTYuMy0wLWdhNmVkNmI3
MDFmMGEtcHJlYnVpbHQucWVtdS5vcmcgMDQvMDEvMjAxNApSSVA6IDAwMTA6ZHJtX2dlbV9vYmpl
Y3RfaGFuZGxlX3B1dF91bmxvY2tlZCsweDMwZS8weDNlMApDYWxsIFRyYWNlOgogPFRBU0s+CiBk
cm1fZ2VtX29iamVjdF9yZWxlYXNlX2hhbmRsZSsweGM3LzB4MjAwCiBpZHJfZm9yX2VhY2grMHgx
MTkvMHgyMzAgbGliL2lkci5jOjIwOAogZHJtX2dlbV9yZWxlYXNlKzB4MjkvMHg0MAogZHJtX2Zp
bGVfZnJlZS5wYXJ0LjArMHg3MjQvMHhjZjAKIGRybV9jbG9zZV9oZWxwZXIuaXNyYS4wKzB4MTgz
LzB4MWYwCiBkcm1fcmVsZWFzZSsweDFhYi8weDM2MAogX19mcHV0KzB4NDAyLzB4YjUwIGZzL2Zp
bGVfdGFibGUuYzo0NjgKIHRhc2tfd29ya19ydW4rMHgxNmIvMHgyNjAga2VybmVsL3Rhc2tfd29y
ay5jOjIyNwogZXhpdF90b191c2VyX21vZGVfbG9vcCsweGY5LzB4MTMwCiBkb19zeXNjYWxsXzY0
KzB4NDI0LzB4ZmEwIGFyY2gveDg2L2VudHJ5L3N5c2NhbGxfMzIuYzozMDgKIGVudHJ5X1NZU0NB
TExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4N2YKIDwvVEFTSz4KCkJlc3QgcmVnYXJkcywKWmhp
IFdhbmc=
