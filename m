Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52793230493
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6A36E218;
	Tue, 28 Jul 2020 07:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B007C6E213
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:49:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXmkvtHNnUA5R/HCX70f/8lC2y1/ghcxHiNznqLzDvDBOTg/O0J0ZjlFY/HYNifnPrczKg9mhZFV0fcM8qk6jd+TfX+jlbG5uKBWRMp7Jz4VEKM3wrI2EHZItCkn04nRArWIX0CipUMwypmxfFpyXwbRHxtb1zKoDp9yFzVAlkg2AwBK2eSFUWGbNHv3puvFAtNhUKYQflMtmc12mD3+iqcf8tFwhBd4N7seLM5f1mvc1fRjcnDP5LY8GeNQoAl5i7W0FTS+0g4XtcX1GfW5LL4B2AW9X19rgGG0AF/yNZqbQeD/TTNKn9bBOqqVWO22HQWyb49OudDaosmsBvkE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhgGa/hSmrsevLqL2L8TiY0I9YO0WY9u7rU1BrY8MHA=;
 b=OdriG45SdWzAi2ZEAaZhwP26HU3OzHr7+hmmIZWJNL/5K1AYV1WkYIjk9yvU9VCiC01K2G9zp+lG87UMYLr7rr+C+kmttN4uJ+VNGuCw8R2Y32F64/pP3C1Hudeu0YRp3vH9NEe4pOjTgIN20p8VIv0FMwpCXb6IxtQ2GbS+lHzN9QNUW9tzSJMeO5LCpmhdwHmFaqvPQryJVjo3ZoS0DJNhz2FBCfz7piGQyq2IlRbCfg0rzFVXoCNYB7RVSaf1sn5Emc1L/x8pA+v0xYnIMOhYkIXvDmSoQ5HMravWhKiHyKD9DjkAcDBBAnEZuXE8ydd2cZPblO83H2OmMLlefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhgGa/hSmrsevLqL2L8TiY0I9YO0WY9u7rU1BrY8MHA=;
 b=sbj3rI1z3LkAQ5yBIxin5IAQoOA37PzWofm/Nx0e/gzAgoHIzSP+e6jTG9B2EaD/qcQHJhjWPP6aULxpWzBCDxpRatcFcwftERVeFM4XPdRrTks4P7n1Ojg1zNhTF3eS8Ou8QMpcYEcqoK/uC0IZVU5Iho/0eXj27I08xMHHNnA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2419.namprd12.prod.outlook.com (2603:10b6:207:44::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Tue, 28 Jul
 2020 07:49:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 07:49:46 +0000
Subject: Re: [PATCH] drm/ttm: drop unusued function declaration
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200728045129.21065-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bbf3f89f-bcb2-dd61-c796-e16960884ed7@amd.com>
Date: Tue, 28 Jul 2020 09:49:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200728045129.21065-1-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0072.eurprd03.prod.outlook.com (2603:10a6:208::49)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0072.eurprd03.prod.outlook.com (2603:10a6:208::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Tue, 28 Jul 2020 07:49:45 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a7f3ce3b-1cd6-4b69-29e8-08d832cacc27
X-MS-TrafficTypeDiagnostic: BL0PR12MB2419:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24190C8C804740B585D855DB83730@BL0PR12MB2419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dLvLYuwYljdjKe7VUX5ne+hLDY51omyKNAoBj7c6Q79YcSObqOA2XJxRjB2IRdHY5LHaJ9NvfPTVBHXM+raX1tX+PYzSD6PIcfFBa8tgQSzR5y6AiAUd9ZOFUe55O61HVII85lAUgkOz51mU1lgER/em2e7AIXoeYsHpMZAR8IF18l2DkQOTbtF+2qzDh5L8KpBPXNYTvU/PYPLyh68uXaw6vHuH1JYv+u7Zd3ne88ISAmluw685S/gh5YHYZm3cTSxQaZjJqK3KqexHaNb39aTGTdZPh5++Nf5Kuabx/xAWJI8Tp7kg0N7FUAFadRy+/UeCw9pi2U8+FREDCCQt+qbgjOudTdfWPm8kdi7oKADKQjkrK6/fZgtEsWIKlLzn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(66556008)(66476007)(83380400001)(66946007)(31686004)(8936002)(6666004)(478600001)(8676002)(86362001)(6486002)(16526019)(186003)(2616005)(36756003)(31696002)(316002)(52116002)(5660300002)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: pB+IUDsoaw8IU3TK1bETCx2TiGK7uZeXwSKMqY4whuODJMpVVEQu1SacNyD7j4i+hoApdFF4hDDi1zSdW8/5uUNA4s8rKKjWb820LFN6z04JF/+GIHk3srVlfFDW6dN5FllbkasJz+pYlaNY6BrUweJW1lMTJkHWx6Mfe+D8Zg/KU7bDfdPwFOLzTWM+I53askLWj1o3SWdNMlblr+bMIgaqoyKYGxyVBh+HzDhkZvDCPnGuHuj9+hB40BSXC8sBs+M6B/wplB8s0M9TdMZuzafo3QlE0M/wjoFJZi9DNQkb2o+QXftVjX7sQhwFyZ4QXs8sZ+bxFKzo67phMjDn/q5d5ZtDiDqh+oM9GQT4DboXiL5Hh7E5vFUAAIXSbS0VVdHh6e7U3RDMEg0uXSrBazxz0U7SuxTds+sMbXhhkE9yhSfCHMfi0A+mnLR0qDZt2JlxmvLQHSwdSJgkYmj2ZPBokmgDiV8DE4a81oz3O9uDr+gFKTbbsasmCMFthegnThNLs7BaJSNH0u+EmjzhqfnP3uGInQMX1Btqk84pywynFvLogs0GN0iWiWEoMJN2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f3ce3b-1cd6-4b69-29e8-08d832cacc27
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 07:49:46.4115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/PM0qRRWzMLuuYS7mA4fyWjlDipjThKQ8g4WLTv74aN+rpuAzjv3733naaDqReH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2419
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDcuMjAgdW0gMDY6NTEgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyB3YXMgcmVtb3ZlZCBpbgo+IGY1YTlh
OTM4M2YyNzlkZTlkYTYzMjk2Y2I2MjNhNjQxOGE2NjE5NmIgZHJtL3R0bTogcmVtb3ZlIFRUTV9N
RU1UWVBFX0ZMQUdfQ01BCj4KPiBidXQgdGhlIHRoZSBkZWNsYXJhdGlvbiB3YXMgbGVmdCBkYW5n
bGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+
CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgoKPiAtLS0KPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggfCAxMSAtLS0tLS0t
LS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2Jv
X2RyaXZlci5oCj4gaW5kZXggNzFiMTk1ZTc4YzdjLi41YTM3ZjFjYzA1N2UgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL3R0
bS90dG1fYm9fZHJpdmVyLmgKPiBAQCAtNTI1LDE3ICs1MjUsNiBAQCB0dG1fZmxhZ19tYXNrZWQo
dWludDMyX3QgKm9sZCwgdWludDMyX3QgbmV3LCB1aW50MzJfdCBtYXNrKQo+ICAgICogdHRtX2Jv
LmMKPiAgICAqLwo+ICAgCj4gLS8qKgo+IC0gKiB0dG1fbWVtX3JlZ19pc19wY2kKPiAtICoKPiAt
ICogQGJkZXY6IFBvaW50ZXIgdG8gYSBzdHJ1Y3QgdHRtX2JvX2RldmljZS4KPiAtICogQG1lbTog
QSB2YWxpZCBzdHJ1Y3QgdHRtX21lbV9yZWcuCj4gLSAqCj4gLSAqIFJldHVybnMgdHJ1ZSBpZiB0
aGUgbWVtb3J5IGRlc2NyaWJlZCBieSBAbWVtIGlzIFBDSSBtZW1vcnksCj4gLSAqIGZhbHNlIG90
aGVyd2lzZS4KPiAtICovCj4gLWJvb2wgdHRtX21lbV9yZWdfaXNfcGNpKHN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSk7Cj4gLQo+ICAgLyoqCj4gICAg
KiB0dG1fYm9fbWVtX3NwYWNlCj4gICAgKgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
