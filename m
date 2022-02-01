Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4155A4A6CE1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623AC10F94A;
	Wed,  2 Feb 2022 08:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 475 seconds by postgrey-1.36 at gabe;
 Tue, 01 Feb 2022 23:09:33 UTC
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD4810E234
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 23:09:33 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 67ECA400D8;
 Tue,  1 Feb 2022 23:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1643756497; bh=G4rMkW1bjVm5YEn6SUHCeyWQ0LlveWUfvP77/4cLQQA=;
 h=From:To:CC:Subject:Date:From;
 b=f5lJpL6YQtQ42KL1vTRS/Qg0pkaJG91xFmU+M+cuI9DymQQNr2IUPv70ZN0x5VuUI
 ApRcuJFpZOXN0PDjSRI5S0JKKk/2pJdZF5Chhh1cOrEXAz5gHXYAXhnxJE9Rw/rt1A
 H62zXUF1obc3+6NOJwgawpNEvycrfE5ogRgVdJP7tbzaRq6zULIM4Xi/O7dFCO4pP1
 2sXFMzooIOmL5CMZVXUTPP9cSY2dqOg95P1ikClUQPIsHIIsYcQ1zcbtkTO2LTE2zy
 zzhW1X7FCiCphho6y1qk5Rt5tIfnAYyrQySFcAO1QKrxMYrjsEIW+8PLKwYLNXMv/J
 A8dyZhtKUrgLQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id EC16DA005C;
 Tue,  1 Feb 2022 23:01:32 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1B7698004B;
 Tue,  1 Feb 2022 23:01:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="mcTgozjV";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqfbAN2mZ+yIrgLHzHGPEx2MDhZfhSKhKS4k9I04jBuGuQnTZvyyf0S9+O9qoMf4kwPLcCdRAvlnXsV5EML+zJR8IhHTja9oeLU8wqNkQO0zrtJdjj5odT03ekhw+Lm5o4/7cU+Dxf0bc6yYG6zZkFhdxI5trspepFKbHTbAWj2bZ5G9IErUdlVmTBinXdhMpfVb4ifwzG8FDtJ0lwriWclcT306V7vUQGUMYY7rmytLwyCFwT/mU2LWilpxzeMSrsz377MCTLv1FfBNXMsm+47ZiIGNdyEgcjW59SbKjZn27utGQl86b9lHHYDpBX3t7Iti5L4Yv0htZeYd4FOyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4rMkW1bjVm5YEn6SUHCeyWQ0LlveWUfvP77/4cLQQA=;
 b=S9TpB7TMopBwgREQRchMFRgfm0eQitw1jni9fAfiSl98I+CPk7xyp5jK6IVbPCWSKUsUFfFBUSc6Jlzr3XWS3mzL7SdLO3md5m33rgo8Rvm5VSg60vodwHeLSnMzLPG9tfECv/qurT1RUbpNApHam6KTrr9W0zfzJxPj8yhahA/X14KcOI3Gkl0hsFXLi+oPEOu3IX4hh6q5OD/ko0fAggOIQRL0Yw+IL4p9M9sOTrppH7Ezw8iXanN4WUwUZ/BF8DVgYvJhoKQS4kacwd2oJY3yUXZbREiSCFsx0AIYX9jEbM+JlW95snUrUICJmm3nwOrdH/T10C1P5by6/pl95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4rMkW1bjVm5YEn6SUHCeyWQ0LlveWUfvP77/4cLQQA=;
 b=mcTgozjVQQVjg2LbTMBdhySyxq2fVOBRHeAtyk63ovuFnQ1KiRjrLqZ/jhgvbSYdOyF3Bm9sVGGAa3Z/skEees5zTJyg5TDWQlvXCHHvmSPFQU3mOSCmBwrv9MpS2I1r3uGAkf/0dGkxuK7YZYzppF9lbHEmAUSTvET9ZZ3XiNY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM5PR1201MB2552.namprd12.prod.outlook.com (2603:10b6:3:e3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Tue, 1 Feb
 2022 23:01:26 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 23:01:26 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Arnd Bergmann <arnd@kernel.org>
Subject: Kconfig CONFIG_FB dependency regression
Thread-Topic: Kconfig CONFIG_FB dependency regression
Thread-Index: AQHYF7+jJ2OaNYIQN0qLBwE4mmvJGA==
Date: Tue, 1 Feb 2022 23:01:24 +0000
Message-ID: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7597729f-1d91-4bff-9bd1-08d9e5d6c63d
x-ms-traffictypediagnostic: DM5PR1201MB2552:EE_
x-microsoft-antispam-prvs: <DM5PR1201MB25522470A6B5AEDF71055496AA269@DM5PR1201MB2552.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E1cRzJuU7PanbWtrxZk3HQm6hr7rGyRLNx28DSiwH2l/JJZfQyTMr+lBe2ef8ehpWnoIIuN3rOGEMZmHl2dKAgOJpvuOiqo3sc9YBe+iZ6SeLWx+iCzYe3mJwfwg21IrUG0J0qaCoHTVkZP5v9l6+yXTE9IhHMtgthuAi/KoSefKXmqcUSWaUl2345lhpPPywtMdhY7C9iTOY8N570ieyEZE0gr+xuJKsUftUntphFXkYduJqEree8Qg1U1hPJFKgENIN0I4SWMWSuJ+AGa+SrprI49x2LYvA+0FhN4M3mxw3gAx+RszRdc4LJxr1151PyrxpgNjb4ePAWY+61mrGNmqHPPJmUyZco412M3V8ePIMbaIeJlekFlZn6K75deqgQJuD/7z0wBXaJ2fOrNmrx2ziBj4KqlN+IUeLTx3uTChSqo0m0pnfNFYetxtx2/NmdWAPwbuvw811UEwWKjxoasRBQvwNajlI5Oe6vmmA9WNLBOlqQWMAZfnkjY1+0AWmLhP6KokyBaIZf31l6ta1nHxJcTHHpB+ZThhMsVkQyZs8DY4j7Rc6Vgo6yc+gutctP82rm+90lyRHu30dC7qX2ltaTwH6IcxDmR10l0EgPU7+0KYwBRo2TVKeEzzmfNA/YezK1fCWvVAFlEvrgOYSvjVAh8D6yxLLU/1q8OqIbFXxk1CgAzCI2YHyB0VY6F4zYQrhdyMM9U6udS1sI7v5t/RfBtIzkJVkBqVcKipKfTLj4imlzDlVZIxN3Rql9I/ZinMvwfBqlZfK4OUpMcX2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4791.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(2906002)(107886003)(2616005)(26005)(4744005)(38070700005)(71200400001)(122000001)(76116006)(6506007)(66946007)(38100700002)(31696002)(316002)(36756003)(86362001)(66556008)(54906003)(64756008)(8676002)(6486002)(4326008)(66476007)(66446008)(8936002)(31686004)(6512007)(110136005)(508600001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enlkN2Z0VUxyUmV0SU92N0tUdkgrKzlaamN4RHgwMVoyaHA1ZGRLZlNyQlF0?=
 =?utf-8?B?MXFqUmRhcThmcjhEeTllM0NhL2d3SFRuWVdvTTFBMHYyY0J1eHFybU42OU5I?=
 =?utf-8?B?QURNb3lyNUM1bFFCc1J1TVRmREFRSWIrMWxlZTBQbCtxVkdmSStMSUd0cks1?=
 =?utf-8?B?eE9xVmlrQzV0RTRaKzE3Z2RNeEhZMjNNRXB0dm1zUWt6c0lGRE81WDRVMmg5?=
 =?utf-8?B?RndhQThObFhBY2xHUnAyZzg1T1dUQ2Vtb2pVbU9mNDhONG5KeTYwdGJkSTM4?=
 =?utf-8?B?ZmJFUXVpRFROUEVtcDdMNEt4YnZ2ZG5sSzBvSHFNdHpDRUQwYnNnWE9QcXl2?=
 =?utf-8?B?ZEJYMzdHelRlNlpBaEwrd252OEo4WmZ4aHFqK1NPZGx3ZVpzVmF1ZE1BZmJO?=
 =?utf-8?B?ZDd0Ni9yT2RTNkZIOWo0bkZ0VWZaN0xqTWYxL1ZseWRpcHVFY3JxWC91cXBB?=
 =?utf-8?B?SElYWjlwRC90SnhWNmtDL0w0UnRrZHVKcDJjZkNJS0s0R3Nhd1dSM2Z2MUI5?=
 =?utf-8?B?TytTN2hndUpLays4dDNqWmdJV1h5dnRnWUJOMUFwTXZ5NGdBS1JVUEFKVUZm?=
 =?utf-8?B?VFlSMU1SNElxMElkOFdVelZsNmluOHhBVEtIR3lJMHBFdFo1Ym4wN1k5Y2lz?=
 =?utf-8?B?QUFPTXZSREt4aTNpaXJramVnb1pZaTFYN0xvWitRZm1vN21BU3ZuM2hkZStE?=
 =?utf-8?B?OTBrNmFIUFR3b1QzeFM0Tm40T2E5NDlScnJIejlQbmoxVHdJNUdkaTBhcEQv?=
 =?utf-8?B?Y2doY3BXZkorT3hXRGpUQ29nTzZjOXBFaTMwd2d2aEhIMkRDNk11RFM2VHNt?=
 =?utf-8?B?WHNIVzdGKzRtOW9SM1VrUDdhdnhnZ2trYTlxWkhHd3ZzU3M2aEpZUmJETEVj?=
 =?utf-8?B?RHRjNXJMSkZONEZNeCsrclhpanZSK3poWnNCQjJLa2ltMTQvWUVTVnh6dWNr?=
 =?utf-8?B?alF5bG5oUW1FZC85UHFXYllRbHBJUDBLdzdBcUMvUkIxaUtmUklWS040ZmxM?=
 =?utf-8?B?Qk1yVHpxbFNYS2FyNThSb2xCVFJRTzFORnlYZVdmdERaQUNUenF1RnRBbDZs?=
 =?utf-8?B?L1RaQUlSbUdVNEZPUVBsRDJRR1VWUis4QVhNZldoQjBnUTlFa0RBMHZ4SU5S?=
 =?utf-8?B?RTloL2hkOGpVdWFoYXZxMUpuNlVLd2dNN2VQMVAxQlJXcWw0ZkJQdW1MOTZ3?=
 =?utf-8?B?aklqR3l4Lys5cTRXalUySTVWY1NlYWpLWC9DY0kzTGpIZFVFVU1JbW9uc1Ny?=
 =?utf-8?B?M29ML1Uzc2lvdTFGK2JMY1hMem9qMldoWHlhRXdycVpjS1kwejNxVU1hK0w3?=
 =?utf-8?B?Z0lwZ3V4WWthQWNNZEkxS2wvT3FWRVp1TGVtRU5VRXR3T2JHajdJcHNxbTlU?=
 =?utf-8?B?Q1JDWEFjRFZ6RWh0ODlHQTB6OXNuR0lsRE1wQzVpOVdnMzlEWUxRRVJLUmV3?=
 =?utf-8?B?MjVmdFRFSXYyVWV2cEdvRUVRZ3Rjc3FWNHk4RjBLcU5Gb01XNWhKc1ZWK1V3?=
 =?utf-8?B?bnZ3T0o3d2VQMWdQanFQSGR5SXB4NzdDL1hvdm83VDBoSE5OdTZXa1lZMCtB?=
 =?utf-8?B?RGF6QmY2blU1T2NRTGorSHVKZ2I0bkZkOXovWUdDNGsvOVdEQm43SzVFL3Fr?=
 =?utf-8?B?bDIrbGdoR1RMMWZaYUNNZmdrUGl1NVNYeEgvRUVla1A3Mm1xVXFoeDFVbjZ0?=
 =?utf-8?B?b1VYVGZvS2dXMjVRdkwyTU1FZm9RUDNQR2Q4c1Rtcld6WUt3Q0hENDBxSFNw?=
 =?utf-8?B?K3FMZ0JNbUJpYk1jKzkxTkc4ZzNQMFN5RXhwYkpkMU5xZkptMCtrdG1OclVo?=
 =?utf-8?B?RlVPR0drMmlpbEpLWE1NTmlIQjZoV2pNK0dxT1k1bm9pTk5CMlBtbE9Zek50?=
 =?utf-8?B?Vmk5TXZXbUxwL29nL0hReUU2WkxHL1ZxcDBwNmlGSTVEQXlpcldPWm5mbm0v?=
 =?utf-8?B?Z1JrTXB0OEdGallaNVhLSmQ1d25KZGQ2Tkl5THIxSGg5dFNXaWZpSE9XK2xL?=
 =?utf-8?B?ZHRkUjltUnFDL0ttNC9RWDRQR2dpMGtLbERmTVFZeGJXVTZWRGYzaTNPOFpv?=
 =?utf-8?B?dmc3end0T0psL2wvL2ZTanlncVFFTHh5RWNyMHRoSlNPWFh3enFVaGVNYjkx?=
 =?utf-8?B?WnRWcmlkamdvVkVnL2JDSnN0a1k3aitjYVBIbnlwa0U1a1IxL1NmM0JUaEdO?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BF4FE4A2C182C4F86DE8B86F6A0A13E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7597729f-1d91-4bff-9bd1-08d9e5d6c63d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 23:01:24.9450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8OknVnEo41Jr3O/YqORt59VsvB3Nm6o9z4zrm520WrQLdkjGHLnIUDYmNLVvdX+QdFHV9zgFCII42L9Ji7fiHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2552
X-Mailman-Approved-At: Wed, 02 Feb 2022 08:24:59 +0000
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCk9uZSBvZiBvdXIgdGVzdCBzZXR1cHMgaXMgdW5hYmxlIHRvIGJvb3QgKHN0dWNrIGF0
IGluaXRyYW1mcykuIEdpdA0KYmlzZWN0aW9uIHBvaW50cyB0byB0aGUgY29tbWl0IGJlbG93Og0K
DQpmNjExYjFlNzYyNGMgKCJkcm06IEF2b2lkIGNpcmN1bGFyIGRlcGVuZGVuY2llcyBmb3IgQ09O
RklHX0ZCIikNCg0KUmV2ZXJ0aW5nIHRoaXMgcGF0Y2ggcmVzb2x2ZXMgdGhlIGlzc3VlLiBUaGlz
IGlzc3VlIHBlcnNpc3RzIGluIG1haW5saW5lDQphbHNvLiBVbmZvcnR1bmF0ZWx5IHRoZXJlIGlz
bid0IGFueSBtZWFuaW5nZnVsIGxvZy4gSG9wZWZ1bGx5IHNvbWVvbmUNCmNhbiBnaXZlIHNvbWUg
aW5zaWdodCBhcyB0byB3aGF0IGNvdWxkIGJlIHRoZSBpc3N1ZSBhbmQgcmV2ZXJ0L2ZpeCB0aGlz
DQppc3N1ZS4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
