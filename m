Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21F7F58D4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 08:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D935810E0CE;
	Thu, 23 Nov 2023 07:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B513210E07A;
 Thu, 23 Nov 2023 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700723226; x=1732259226;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pTBF+AHw6dufTPopoWbnoPKSUvjupyzI+ijUaTrkM0s=;
 b=LxWK/EMTCj0jG80WJad88FbwQlpbcb9Zlos0+DJY8W9g55+S9/MGEjiO
 JclT1HceAYFRGfx8Uf3cDZejSfBVqtuO2tdayQQn7z4HPiDtMbetON4jw
 ArGOupwL+uWruP4yfRVoHT9NUjB9TG2oaVG5C8sC6yO1DwPSx4sjf/nIR
 eGrAv912cGitaFDTWIGc/iCrXyaMKQPChUzwbrIF/K9q07DFuLFXDqyiz
 F8fIUBHmRB2nCZ1ILjfo93hUYaOHcxzCdm0WbrbFkdArhkFM5uB8yenZH
 WXyvIzv/minjD5dhHxmIkgXfoEZSBJo/DMpG/Hdlyo8CkOHw4diqT9QFT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456547017"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; d="scan'208";a="456547017"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 23:06:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="858036405"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; d="scan'208";a="858036405"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 23:06:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 23:06:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 23:06:57 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 23:06:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyO1GW6eSU/oNwOODYv4wzSY6JcmHdF6uWMOwGhfObWeQfohs5XjNTeQNm12fwTzl/hts9X9OiwcQ/GHsAV9tetoikJxwA2cZJzbdVbtkzfutqtRO6Vj0UxD0Njfuwu0eAbWtNf1RofwBSVVS/ISmuABv93/vs6CPIYSZWUXuPVn3tvdqzGgj5ewakvTZqaMS0947L+bGbdw8em0xBXrQNqlXaz/ZzgPU/Ft7cNjkWa4jiEvG2s2wS34quosXU1R5IUJzfKaGy5mMmxVUZNwzh2M2l2IaNu+PlW2PZ4g4nqAFnVXpC7g8hhiIH05XtPYmovcSALXqnx3ZeI3ZJqqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTBF+AHw6dufTPopoWbnoPKSUvjupyzI+ijUaTrkM0s=;
 b=i2fEjQcgCuO+SL9uPFFwSzvKD0mGjX8k4y8tLIEXeDnIxO4Wed7zQfljRli1Yio+UG+O1nzIGovtnY9Kqitf23nQy28xPqooWOpLjAtyhFF4yI6L0OU5b6flAufOsvOscpgFBqTiM6+Gkl4PAxd3kiuBPso6R6GTh34P15QJfIcJjw3G2HUU1WxDxbLXC+BMY17eOCC0QFs1elElmdLIapdeg0ZHO67wUqCx7touMU246U6gqR0zf+F03TO1ojxU/R48qVLooD5WpL0vXOHlkDxne+pEv4qSPWzcxnkmqL8ljGhkyjrVJTPH8fVShirh5LqN/sNXGlzS2/E2N+S8zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 by DM4PR11MB6068.namprd11.prod.outlook.com (2603:10b6:8:64::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.18; Thu, 23 Nov 2023 07:06:50 +0000
Received: from MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::8b04:7396:7a40:f00d]) by MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::8b04:7396:7a40:f00d%7]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 07:06:50 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>
Subject: RE: [PATCH] drm/i915/psr: Fix unsigned expression compared with zero
Thread-Topic: [PATCH] drm/i915/psr: Fix unsigned expression compared with zero
Thread-Index: AQHaHSFTCz84nhSLckCMX6bT1UDGq7CGDnaAgAFuG/A=
Date: Thu, 23 Nov 2023 07:06:50 +0000
Message-ID: <MW4PR11MB70543D88DB824C6C2821B2FBEFB9A@MW4PR11MB7054.namprd11.prod.outlook.com>
References: <20231122085239.89046-1-jiapeng.chong@linux.alibaba.com>
 <87y1eqm9ny.fsf@intel.com>
In-Reply-To: <87y1eqm9ny.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7054:EE_|DM4PR11MB6068:EE_
x-ms-office365-filtering-correlation-id: a02c9802-ba7f-48cd-9c2c-08dbebf2c404
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x4GxHLcfQPlmD0BBGxdbmaoZd0irAirtkF9x4OU7A5Bb5UUKBfTQwh/+3hk/UNOQpdPuuOxOygOev7qag2gDpsqZgDuSUpWgKVPLj4kbsg/Vsid6/nezH70xoB3E1ELN/z2Skz3oxV2mgx22Tthkgokeu2AUpkBZ8findOKaVFcRStWKuT5ysyetG7n8/OlTUHVNj3oltfLCWPMeCHhxNTy9brYtJaNV0qDYEkMuWvBMD+ifKL8zs7RihJziRULlF5fsn9kE81jyxlgr4emfOrSOSGTMJ9SCgeTwtkBgyrjJBLIAUYe8bStPAp1fmStRJyG2Wzy65CcfoZ3deHqAU1yhgdUoQhokDUK7dXDk4xtFYqkIBKsnJFdexlwDk60o6CTQn4q7px8AaMDoqKCMMW2XDiboXIp12viXDxifpUe/vDZ09C9iXTccL7iKltDxwgDgciXzfUWyZ0AQL7kzcQBEVj+Q7m/OZF1zPFD0yvFtK5UjYcCDqD6xl/Lgw7hhWawglp+tJYXns4OgM24SK+e4ih1duh9lYMiW1NkorOpuOEygBFaYWgExMOY2xPwgFrUxRN7Ri0K44xtTJ63m+5vlmiFjnquPgUDm+f+DPnigQs+DN9fgEC4QnAx/Vo9gAggVUtYt5iVW8W1j6Mip+TlCJlen7P9UJrHHq8qmiqm0+v/4g+ZfFYKDrU8rRACU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(230273577357003)(230173577357003)(451199024)(186009)(64100799003)(1800799012)(7416002)(86362001)(33656002)(5660300002)(2906002)(8936002)(4326008)(76116006)(8676002)(110136005)(66946007)(316002)(54906003)(66476007)(64756008)(66556008)(66446008)(52536014)(38070700009)(41300700001)(9686003)(82960400001)(26005)(83380400001)(55016003)(7696005)(53546011)(6506007)(71200400001)(38100700002)(122000001)(478600001)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTF6ZDdCajJpOEhXQjNkc1d1TGQ5VE44N2Y2bk96SmxTR0ZCM0xXMlZ6VkVB?=
 =?utf-8?B?cjBsUjBCWWJ1ME5tRVhXUTVuQXN0TEdRK1FhNHM3SHp6TzA5WkJqcFFtMzRC?=
 =?utf-8?B?M211TzFkak5DQUxpdnFKcEYvWTk2L3VYZWJac0hPdUo4VDdLZlR1SnlIUlIr?=
 =?utf-8?B?WUJWVVVHZ1ZtbG5RTkpMWnRjbzhMSHVyNjhIdVJMbnBOTTZac0xhQXJtbHF4?=
 =?utf-8?B?ZkhYMElITTU2SHBtMk1mOEhPb3BHeUtpVDZTaS81VnFtVURmQkIyeWpLOHdW?=
 =?utf-8?B?NE9TVkRpWWdPS3liSklGSWI5ajNhZDZBbnVaOTJ4WU90a1JGMXlReG95cnU4?=
 =?utf-8?B?TTZQeVZINE9OS1gyUWZNckZrZk9JUzhzVWw1REh6dUNlTk8rQzExeWZCWnk2?=
 =?utf-8?B?OEhra2lTZWFmK0k3VXhkTVcwWjFGbk9HRWUxR3VGSVl1MWc1MU4wV0s4OUx0?=
 =?utf-8?B?bDdFRjVJcXlsaklnS3RGMmdoYS9OTGNpN3FEYTB3OFBlL2Vlc3ZVQU8zYzVS?=
 =?utf-8?B?aFl1NVBMTm5HRjJNbW5WaXowSzd4bWg0djVoYXNkUEZyeHY1RFZOVjc0VFNj?=
 =?utf-8?B?cXNQN0VzVTkzSzN2VTRlbmtLallzZ2ZEcVNoVEVLelhjSkoxQk5wc2h3ZmZJ?=
 =?utf-8?B?SHpEcmt4dHQwMGxrUHZtNDdHK2JVMVBMZTBXM1BwZmw2dUJUaFhLN25wY2Rl?=
 =?utf-8?B?OFR3bm13b2ZBWmNtRXZoblVEc2FGNnZ0Rmp0R0grV2hPNFkxL0ZCcFRzYllp?=
 =?utf-8?B?bmlNcXlIVjBJOWV6bVpCTFRMQUk5SEZNekVmcnlsd2k3OTBpVmpIN1ZoaU1L?=
 =?utf-8?B?MEpjWVIyaDdGNFgyTGZqaXZnOThoZXRScnkvRXBQRTNpbmJYTi9uSkVxRm5D?=
 =?utf-8?B?bVpyczMyTDhBRWdDOUFVcEJ5WUJJS2l2ZEFlMmxUSWJFTzJIR0p2MmpLQWJD?=
 =?utf-8?B?a1JRa1JMMGZvSk5GOE11blc2Nm0wZjJjNUljcEpJK3BveVBwZ3dPb01qVk54?=
 =?utf-8?B?TU01NG1WbmZCRk9FbFNjVGpEQVpqOHpscjhud0dBNGZFTnN5dGR5bzZKQUNB?=
 =?utf-8?B?bHZ6Wk42M2xkVUpReW5WQmI0WkhiSDBKWU4wSjlHbTdOKzgrd1hTM2JoRHlE?=
 =?utf-8?B?ZUJrNHpkVmtXV1RsQjNtaUdrODdFdXl2cDRoRC9FYUJaSlhYZisrbkZRR3hl?=
 =?utf-8?B?YzlZblhmbmdBcHg1cEw5WjZrck9hQktER053WS9pZkFGa3U1TEdsbWRDR3Ey?=
 =?utf-8?B?dytXb2hGTi8yT3h5bzNWR1ZZeEYrRU1HZjFQemxQV3R1MU9OM1lCOG9IQloy?=
 =?utf-8?B?bFVwZDY0L1U4TXVzNlN3UXFsSFZKQUlQaGtsblJidnRhaW1acjBIY0paNEQ5?=
 =?utf-8?B?bmFkWjkyNUxEYTF6bWIxMUNwclFOYTNCVVVhU2pwcXBGZVpKazRkRW1nU1F4?=
 =?utf-8?B?dFd5VGRaM3dUeXV1aFJpUXhEVkRRVnpYRE1yVkhXZ0ZmRnF5NHFkYzRKd2Nn?=
 =?utf-8?B?elVHbTdkSG1XSHhLQS9jTzd2MUJNMCtPRUgrTnMyUU51aVVZSklBazBGK09i?=
 =?utf-8?B?N283Z2pabUg1dEZhNjZWTURNWmhaVDg0aGUwam9JRVlYWWFZQ3oxUUVmclJk?=
 =?utf-8?B?V2lHaC8rRHdsNExMVXRkbnRORVRocGtSUnFENFIrZXptSHV1azd5QndTNnJX?=
 =?utf-8?B?OG5NYWFtcUZYK2NZaDN6OHNPbXFmVDc0MlVLT3JqcjRvRjVsNnd3YldJSmk3?=
 =?utf-8?B?ZUlyK0NvelBpaGJWV1BiVFlEQmtvWWNNWm1lbnZ3NXRLOTkvaVZzYjFVcWJS?=
 =?utf-8?B?c3RHWVUrVmhBRFAzR0FxZmpUQWdFNkxKNHJKMXRSaWR5MGtnQ09LVU5KNWtL?=
 =?utf-8?B?NXRQTTE4MzJVcFgvVDl6TldvWmVuMGlvY3VLQW5yM1FPWnpBcm1ER1NUR0V3?=
 =?utf-8?B?Y1FuOUs5eFpNV3ZLbTVYeVJKbGVXcXVsWjlXRlVRK2s2Zi9UTDdqRUtkNnp6?=
 =?utf-8?B?eGhLMmlFUlhJMjFVcDJwYnhoMHJmYkR6Mk5Ua3NvWDlWV2R6S3dHZ0VIY1R2?=
 =?utf-8?B?NnBiSXg4RWo3OS9FSkpTMno3ck5uRmoxN1pGdUVMVlBPSEwraUZPS3FnUC80?=
 =?utf-8?Q?WNiV4Dm2rgnAYpncYYgdwwu/M?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02c9802-ba7f-48cd-9c2c-08dbebf2c404
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 07:06:50.6263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4gELYErSEEIoSrfuw4WTnnOwVm964SOQq4yoYrTW10/OJV2ryGXx2Sxw82gyXXZnK3owr5s/+0varTT7LaMnPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6068
X-OriginatorOrg: intel.com
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Abaci Robot <abaci@linux.alibaba.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW5pIE5pa3VsYSA8amFuaS5u
aWt1bGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDIyLCAy
MDIzIDExOjE1IEFNDQo+IFRvOiBKaWFwZW5nIENob25nIDxqaWFwZW5nLmNob25nQGxpbnV4LmFs
aWJhYmEuY29tPg0KPiBDYzogam9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbTsgVml2aSwg
Um9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IHR2cnRrby51cnN1bGluQGxpbnV4Lmlu
dGVsLmNvbTsgYWlybGllZEBnbWFpbC5jb207DQo+IGRhbmllbEBmZndsbC5jaDsgaW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgSmlhcGVuZyBDaG9uZw0KPiA8amlhcGVuZy5j
aG9uZ0BsaW51eC5hbGliYWJhLmNvbT47IEFiYWNpIFJvYm90IDxhYmFjaUBsaW51eC5hbGliYWJh
LmNvbT47IEthaG9sYSwgTWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSBkcm0vaTkxNS9wc3I6IEZpeCB1bnNpZ25lZCBleHByZXNzaW9uIGNvbXBhcmVk
IHdpdGggemVybw0KPiANCj4gT24gV2VkLCAyMiBOb3YgMjAyMywgSmlhcGVuZyBDaG9uZyA8amlh
cGVuZy5jaG9uZ0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6DQo+ID4gVGhlIGVudHJ5X3NldHVw
X2ZyYW1lcyBpcyBkZWZpbmVkIGFzIHU4IHR5cGUsIGVsc2UoZW50cnlfc2V0dXBfZnJhbWVzDQo+
ID4gPCAwKSBpcyBpbnZhbGlkLiBBdCB0aGUgc2FtZSB0aW1lLCB0aGUgcmV0dXJuIHZhbHVlIG9m
IGZ1bmN0aW9uDQo+ID4gaW50ZWxfcHNyX2VudHJ5X3NldHVwX2ZyYW1lcyBpcyBhbHNvIG9mIHR5
cGUgaW50LiBzbyBtb2RpZmllZCBpdHMgdHlwZQ0KPiA+IHRvIGludC4NCj4gPg0KPiA+IC4vZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYzoxMzM2OjUtMjM6IFdBUk5JTkc6
IFVuc2lnbmVkIGV4cHJlc3Npb24gY29tcGFyZWQgd2l0aCB6ZXJvOg0KPiBlbnRyeV9zZXR1cF9m
cmFtZXMgPj0gMC4NCj4gPg0KPiA+IFJlcG9ydGVkLWJ5OiBBYmFjaSBSb2JvdCA8YWJhY2lAbGlu
dXguYWxpYmFiYS5jb20+DQo+ID4gQ2xvc2VzOiBodHRwczovL2J1Z3ppbGxhLm9wZW5hbm9saXMu
Y24vc2hvd19idWcuY2dpP2lkPTc2MTANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKaWFwZW5nIENob25n
IDxqaWFwZW5nLmNob25nQGxpbnV4LmFsaWJhYmEuY29tPg0KPiANCj4gVGhlcmUncyBhbHJlYWR5
IGEgcGF0Y2guIE1pa2EsIHBsZWFzZSBmb2xsb3cgdXAgd2l0aCBpdC4NCj4gDQo+IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDIzMTExNjA5MDUxMi40ODAz
NzMtMS1taWthLmthaG9sYUBpbnRlbC5jb20NCg0KVGhlIHBhdGNoIGlzIG5vdyBtZXJnZWQuIFRo
YW5rcyBmb3IgdGhlIHJldmlldy4NCg0KLU1pa2EtDQo+IA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ID4gaW5kZXggOGQxODAxMzJhNzRi
Li4yMDRkYTUwZTNmMjggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9wc3IuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfcHNyLmMNCj4gPiBAQCAtMTMxOSw3ICsxMzE5LDcgQEAgc3RhdGljIGJvb2wgX3Bzcl9j
b21wdXRlX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZHANCj4gPiAqaW50ZWxfZHAsICB7DQo+ID4gIAlz
dHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSBkcF90b19pOTE1KGludGVsX2RwKTsN
Cj4gPiAgCWNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICphZGp1c3RlZF9tb2RlID0gJmNy
dGNfc3RhdGUtPmh3LmFkanVzdGVkX21vZGU7DQo+ID4gLQl1OCBlbnRyeV9zZXR1cF9mcmFtZXM7
DQo+ID4gKwlpbnQgZW50cnlfc2V0dXBfZnJhbWVzOw0KPiA+DQo+ID4gIAkvKg0KPiA+ICAJICog
Q3VycmVudCBQU1IgcGFuZWxzIGRvbid0IHdvcmsgcmVsaWFibHkgd2l0aCBWUlIgZW5hYmxlZA0K
PiANCj4gLS0NCj4gSmFuaSBOaWt1bGEsIEludGVsDQo=
