Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCCB348B85
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 09:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B2F6EB4F;
	Thu, 25 Mar 2021 08:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77456EB4F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 08:29:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msbekGDg2PMPLPBBUa/Hid8HAr81JN5i6eAzaZ5lz+IMpROBKXH+IB/mRHevc8q5+xf/UA59xE4TDZ0yoew8XD+RRkcZMwNjnf6R/3cGsaxrvN86JuiTMRibCe5UUOTAA76dYivI59nKwPnnmgFgAuquI5cKg0zAyn6mNbnnRkSi3Ubq43GrEtsft2n7qeFqnG5LKh7lPeBf0LOxfyX3VXmYCY2z+RMnbQsYKBDJzDOclqtY7toweGLlzf6lg3rN3SBjCpKV7RXoVshwpGKHkTubiSK8e1AtjkE3PqCuGG6JjHKoB/bV+OvG2DWCdnEE1O9IXCntWIWvH4vZtiodiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQADfMG9L4DRjM7zdiyF5jOvoDbbqYmiyt4LEyx9myE=;
 b=d0gYOP10SgHuUZRgQCqo3RMPSkid0UDLlfNdobC4lfw+7HM3Kug7SHIQVkS5Pb0j33EVSyjs/n5Wx5J8Rq43T3Hl4DCYjIN/a78ZOj0EcDbJhXCm/Dq3al4d0AHbYsxA5IGcJYh2pjrmQw2pt0yiI7r3PR/iBzFk41iyh0D6qCKz4aoYzu/mLhyFwXaat6GIYA128gvDcWFQfnKw3j8lwEJfy74F7PFj4B2S8bUog1cL/m0pNZPEk+yYI1CzdD62k3KP7bdiSJrUzJh8Cgmh9mQdfO0IyaVTNjV0LCrv4+EuJC7BvfT3redxzcR47eeUcCApAJyhN4td9FaNpzCnkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQADfMG9L4DRjM7zdiyF5jOvoDbbqYmiyt4LEyx9myE=;
 b=xnSbkyLocqts78eJohgIWd3PTLrO3MOZalN0MKqQ9XpnXX50UGvEzk0tC0CpLMqSpFyYMpg53gAphIr/QLWNbb5g/szfFxuHKWRIMCqPBKw1jMW2KyUbCnjXdwzHvciSSDuqFgcKIjULxk/+p+7CQIRpuw8EWO07KvDsC/uK110=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Thu, 25 Mar
 2021 08:29:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 08:29:24 +0000
Subject: Re: WARNING: AMDGPU DRM warning in 5.11.9
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-kernel@vger.kernel.org
References: <CAK2bqVJ+=nHTK-hnUC=qL1mcOvHWTCwDMYPBKJp77QCbBvBGGw@mail.gmail.com>
 <a38a3c04-4ac8-01a6-da69-a2bdaa54f61d@pp.inet.fi>
 <20210325081702.5kdzp7moqhcox65b@spock.localdomain>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5eb58748-72e0-3eb4-593a-6e482133af17@amd.com>
Date: Thu, 25 Mar 2021 09:29:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210325081702.5kdzp7moqhcox65b@spock.localdomain>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:a792:596e:3412:8626]
X-ClientProxiedBy: AM0PR02CA0163.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:a792:596e:3412:8626]
 (2a02:908:1252:fb60:a792:596e:3412:8626) by
 AM0PR02CA0163.eurprd02.prod.outlook.com (2603:10a6:20b:28d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Thu, 25 Mar 2021 08:29:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0241856a-1f4c-42d0-64bf-08d8ef6818aa
X-MS-TrafficTypeDiagnostic: MN2PR12MB4157:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4157FB835A0CBD6BF666E7A983629@MN2PR12MB4157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: povz0XsZi1pQLbfguMWDr/66CjOXdIA2CZJtdpSkW3zldXXPsDoCiHyqeHCx5oFEk2elgSoa6gG1CxN7gajlzl514mM5cKPqlDw3gHL8XJz2PigP1uKCp5p0Hh+OO9gxrrWOSyV+uIIAVDBUccmqUXW9pBvG6upMRWJaFD/ciC2bmYDjDbwGNVTNyut/nvxiyzhDzw7qyYXQp0cxRbKLMo7W+i9wRET8ZmAj/jRinWZ3C2l2GfHrjBPfBrl/Yo2+QFRVP2c0IlEMNJDp/jAbcUFQM+RhSvBadpLNAUwRpGUsbqWT3kzHIhzZJLqMUE9Gx4MgWg4czq2QPZBgjfWu46WDaHPvy2NJN+Vh8uY8KBzh22VaYOzJqtrcCTAzT7BoG0jZvCr7lKWiIM2JksEwxgtZZRaozHaqZdfe9AbP0T+hZPN2rRgHAX+ci3wWzkrdaj1YWyKzEoCiVxj7YtRWHT1xRsmIeGX0z4K0UC2z4/ge49UqGPA8O+xfEnj/C1auq2kxrXcYnm7gRINLwG15ljqfk17+zvDWXnf+1irLSZGb42Vwr7/aQWOjzuQhcv/9AkiSB/x1zPkNtJFvlXxLaDF1ClXhxN/e8xPa7ztlhHf2vaSvGKrQkRbM9dwksUoxyn/69TTUOzE2CvfYNGDnHuriyApdrVgnLSZ8TdKVV5INN5rSFIkXv7TIeE8mk7WJyIEkxXoDj5dnGNltdlFerzontpTO0lLHNTumfux7Qwk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(31696002)(38100700001)(52116002)(6486002)(86362001)(316002)(36756003)(54906003)(8676002)(478600001)(83380400001)(31686004)(8936002)(2616005)(45080400002)(186003)(66476007)(7416002)(6666004)(16526019)(66946007)(5660300002)(66556008)(2906002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L2l2T2VGd1F4SlJPdnBLQTdKYXBHdTFLK0ZwOGNybTBDQUNnYUhPV2I3QzRN?=
 =?utf-8?B?c09GTzdScHZDT1N2WWtpeEI1ZVpuc1Z5RHZmSXk1M1dSbkExQWpHZGpJSk02?=
 =?utf-8?B?RjBMblpVQjFBNXd1a3lrNVlJMHpiRGdKSWxOYmpDNjBES2NCSi91VnpVcUhk?=
 =?utf-8?B?ekNPYkk5M0tSQTI4enc2UFlUVXhrK01BYWRYaFVQVmg5TWpnQkpzaFBpdEcw?=
 =?utf-8?B?VG0yNFk4UHlkRGgwWmJwdTc5bTB2WXU4NWFPa2dWTzhwQzhJNUlzN2lNTDRU?=
 =?utf-8?B?eGxkWmhJSkpTQjljMWlaenF3UUQrMzhtMENVcmlGRXJMSFlhYTdOaXNWYTdB?=
 =?utf-8?B?dEMzeHBlcGhpRi94ZUorSkRlR2lZVmFTOXp5ZS8xVEkyUTlFT210S2NuYjdE?=
 =?utf-8?B?K0hPTzNIdjg1T3JNQzhqRXdCNXlFaTZNRmxJQ1I1cmhQNG9URUowUDFGZ3pU?=
 =?utf-8?B?OXZRbFR1dy9vckJNZEl5L1VQSjV3U1J2bnJJVFZzOWZQcXJVOG1vMmt6aUhl?=
 =?utf-8?B?WFp6bFg1RU1qMjNSdldmL3RLNS9iSXYxejB3TVNQcGNtcDBmbG1OQUxnZGV3?=
 =?utf-8?B?aTY1dTRBejVWYXh1Z1RjRzROK0NleDJEZWc2T1pNeUxOS1JZTFgyMjU5Rms0?=
 =?utf-8?B?ZjRoSnlVd3BrMmpIRjBsbWlYOXg1THpuUXlBTUdGMUZjcE5EUlYydkNKQ0V2?=
 =?utf-8?B?Z3duN0I4WUFyR1JhcWFXN2E5dDNTWEtDOG1OZlUyTW4vZ1FlcEZ6cG5BbmJU?=
 =?utf-8?B?VWZ3R3huTEJtRSs1NTdhQnZoZjFGcEkvMitoYU1DUzlhWUM2WmdOOUJFRjZU?=
 =?utf-8?B?U0YwN1RFZjFjYjg3alRkOVNhcFo5K0h5dVp3ZzYrZTVoaThKQnY3K0MrZ0JB?=
 =?utf-8?B?SW5BUW1OOGtaM2x5R3h5RVg1WjhRSUUwVU1Nd2l0SnJvUzYwMlExc3dHM0JW?=
 =?utf-8?B?NUl1Sm1ldXVicFZqbUJDNUxoM2VreUN6QU1iVlJPa202anlBMG11bHVydm1l?=
 =?utf-8?B?SUZYMXJzR291LzZRSmpLb1lsYlh5OFZaUU9CaHNRdnhDb29XRHVSSFArMjlm?=
 =?utf-8?B?ektyNHdNeGlnZW11UzhJaXBERFVsdEZwcjkyM2c3clJJS2duNEVvd0FZaVZr?=
 =?utf-8?B?SEJQV2hQdUpTY0p4ZklJVkd1SzB3bUxWVkFxN0txWEo2RDZESjJlSWZzczhq?=
 =?utf-8?B?aXMxNnJ5c0kweVMvazI3QmdscEN3amx2b1Q3RGZBUXhVc2g0NjgzcUtuZUI2?=
 =?utf-8?B?YXB5UE1CelNzTWNKNkRGQlhheFlzWXpKeUszc1Y5SDdSSzgxaWIyY3BKejl6?=
 =?utf-8?B?eE5PRzFYR09jODlBVU10K0o0QS8yK1dpU3lXMENMNTQ3cTAzK2lyTzh0bnRh?=
 =?utf-8?B?alAwVU1YRGFEQndJendybnc0S2hSUEpVOEdJTm5aY215OXQwaUJ2ZEM1WTIv?=
 =?utf-8?B?K24xc3pJa2pTeWJLK0RwUGJyclBMQVhLaGcvaG40blNiNGhUMnJSRHNCWHVO?=
 =?utf-8?B?Wk1mSzkxQ3Q3WGMwbDc1V2FjRmhWSjRYTlBtdHhqMG1XNW1PTjN0TlZIR2Ri?=
 =?utf-8?B?dVZYdG0zajB4bVZLRmc1RWZzRHVSUnBTdzFTZlRJR2U1UkRCYmlJTEdGTDVZ?=
 =?utf-8?B?YUpXLzF3dFlwa0o2Ti9jdWFIQyttc0dMRHJnNHE2enBCcHgxZjZvUTBXa0tX?=
 =?utf-8?B?eFM2WmIwM0twbG56cEtuckxRdytvYW9VTEEzbkh0cnpNaUx2dFhGME5CZDNZ?=
 =?utf-8?B?Z21taUhpREdMYnR5dlR0SlFiUHVnTWViZjJxZXJHWWVycWY5MHJlSTdaN3VF?=
 =?utf-8?B?K0RHUTFjRkROemVtb0k4Qm1jTFhJOXpGM2hXRW0zYnlmQmlIZU5rdjhYWGNY?=
 =?utf-8?Q?B3YAPimJbuzIP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0241856a-1f4c-42d0-64bf-08d8ef6818aa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 08:29:24.3421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGVvnDJaoyKDwod0ad5ZWCZs9YJRjIzBm4H3exq6eWZREe2K3kogYefMrXOBmi7j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157
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
Cc: David Airlie <airlied@linux.ie>, Chris Rankin <rankincj@gmail.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Huang Rui <ray.huang@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ilkka Prusi <ilkka.prusi@pp.inet.fi>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpBbSAyNS4wMy4yMSB1bSAwOToxNyBzY2hyaWViIE9sZWtzYW5kciBOYXRhbGVua286Cj4g
SGVsbG8uCj4KPiBPbiBUaHUsIE1hciAyNSwgMjAyMSBhdCAwNzo1NzozM0FNICswMjAwLCBJbGtr
YSBQcnVzaSB3cm90ZToKPj4gT24gMjQuMy4yMDIxIDE2LjE2LCBDaHJpcyBSYW5raW4gd3JvdGU6
Cj4+PiBIaSwKPj4+Cj4+PiBUaGVlZSB3YXJuaW5ncyBhcmVzIG5vdCBwcmVzZW50IGluIG15IGRt
ZXNnIGxvZyBmcm9tIDUuMTEuODoKPj4+Cj4+PiBbICAgNDMuMzkwMTU5XSAtLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4+IFsgICA0My4zOTM1NzRdIFdBUk5JTkc6IENQVTog
MiBQSUQ6IDEyNjggYXQKPj4+IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmM6NTE3IHR0bV9i
b19yZWxlYXNlKzB4MTcyLzB4MjgyIFt0dG1dCj4+PiBbICAgNDMuNDAxOTQwXSBNb2R1bGVzIGxp
bmtlZCBpbjogbmZfbmF0X2Z0cCBuZl9jb25udHJhY2tfZnRwIGNmZzgwMjExCj4+IENoYW5naW5n
IFdBUk5fT04gdG8gV0FSTl9PTl9PTkNFIGluIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMK
Pj4gdHRtX2JvX3JlbGVhc2UoKSByZWR1Y2VzIHRoZSBmbG9vZCBvZiBtZXNzYWdlcyBpbnRvIHNp
bmdsZSBzcGxhdC4KPj4KPj4gVGhpcyB3YXJuaW5nIGFwcGVhcnMgdG8gY29tZSBmcm9tIDU3ZmNk
NTUwZWIxNWJjZSAoImRybS90dG06IFdhcm4gb24gcGlubmluZwo+PiB3aXRob3V0IGhvbGRpbmcg
YSByZWZlcmVuY2UpIiBhbmQgcmV2ZXJ0aW5nIGl0IG1pZ2h0IGJlIG9uZSBjaG9pY2UuCj4+Cj4+
Cj4+PiBUaGVyZSBhcmUgb3RoZXJzLCBidXQgSSBhbSBhc3N1bWluZyB0aGVyZSBpcyBhIGNvbW1v
biBjYXVzZSBoZXJlLgo+Pj4KPj4+IENoZWVycywKPj4+IENocmlzCj4+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMKPj4gaW5kZXggYTc2ZWIyYzE0ZThjLi41MGI1MzM1NWIyNjUgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwo+PiBAQCAtNTE0LDcgKzUxNCw3IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19yZWxl
YXNlKHN0cnVjdCBrcmVmICprcmVmKQo+PiAgICAgICAgICAgICAgICAgICAqIHNocmlua2Vycywg
bm93IHRoYXQgdGhleSBhcmUgcXVldWVkIGZvcgo+PiAgICAgICAgICAgICAgICAgICAqIGRlc3Ry
dWN0aW9uLgo+PiAgICAgICAgICAgICAgICAgICAqLwo+PiAtICAgICAgICAgICAgICAgaWYgKFdB
Uk5fT04oYm8tPnBpbl9jb3VudCkpIHsKPj4gKyAgICAgICAgICAgICAgIGlmIChXQVJOX09OX09O
Q0UoYm8tPnBpbl9jb3VudCkpIHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGJvLT5waW5f
Y291bnQgPSAwOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgdHRtX2JvX2RlbF9mcm9tX2xy
dShibyk7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB0dG1fYm9fYWRkX21lbV90b19scnUo
Ym8sICZiby0+bWVtKTsKPj4KPj4KPj4KPj4gLS0KPj4gICAtIElsa2thCj4+Cj4gV0FSTl9PTl9P
TkNFKCkgd2lsbCBqdXN0IGhpZGUgdGhlIHVuZGVybHlpbmcgcHJvYmxlbS4gRG8gd2Uga25vdyB3
aHkKPiB0aGlzIGhhcHBlbnMgYXQgYWxsPwoKVGhlIHBhdGNoIHdhcyBpbmNvcnJlY3RseSBiYWNr
IHBvcnRlZCB0byA1LjExIHdpdGhvdXQgYWxzbyBwb3J0aW5nIHRoZSAKZHJpdmVyIGNoYW5nZXMg
dG8gbm90IHRyaWdnZXIgdGhpcyB3YXJuaW5nIGJhY2sgYXMgd2VsbC4KCldlIGFyZSBwcm9iYWJs
eSBnb2luZyB0byByZXZlcnQgaXQgZm9yIDUuMTEuMTAuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+
Cj4gU2FtZSBmb3IgbWUsIEJUVywgd2l0aCB2NS4xMS45Ogo+Cj4gYGBgCj4gW35dPiBsc3BjaSB8
IGdyZXAgVkdBCj4gMGE6MDAuMCBWR0EgY29tcGF0aWJsZSBjb250cm9sbGVyOiBBZHZhbmNlZCBN
aWNybyBEZXZpY2VzLCBJbmMuIFtBTUQvQVRJXSBMZXhhIFBSTyBbUmFkZW9uIDU0MC81NDBYLzU1
MC81NTBYIC8gUlggNTQwWC81NTAvNTUwWF0gKHJldiBjNykKPgo+IFsgMzY3Ni4wMzMxNDBdIC0t
LS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+IFsgMzY3Ni4wMzMxNTNdIFdBUk5J
Tkc6IENQVTogNyBQSUQ6IDEzMTggYXQgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYzo1MTcg
dHRtX2JvX3JlbGVhc2UrMHgzNzUvMHg1MDAgW3R0bV0KPiDigKYKPiBbIDM2NzYuMDMzMzQwXSBI
YXJkd2FyZSBuYW1lOiBBU1VTIFN5c3RlbSBQcm9kdWN0IE5hbWUvUHJvIFdTIFg1NzAtQUNFLCBC
SU9TIDMzMDIgMDMvMDUvMjAyMQo+IOKApgo+IFsgMzY3Ni4wMzM0NjldIENhbGwgVHJhY2U6Cj4g
WyAzNjc2LjAzMzQ3M10gIHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFudXArMHgxYWIvMHgzYTAgW3R0
bV0KPiBbIDM2NzYuMDMzNDc4XSAgYW1kZ3B1X2JvX21vdmUrMHgzMzQvMHg4NjAgW2FtZGdwdV0K
PiBbIDM2NzYuMDMzNTgwXSAgdHRtX2JvX3ZhbGlkYXRlKzB4MWYxLzB4MmQwIFt0dG1dCj4gWyAz
Njc2LjAzMzU4NV0gIGFtZGdwdV9jc19ib192YWxpZGF0ZSsweDliLzB4MWMwIFthbWRncHVdCj4g
WyAzNjc2LjAzMzY2NV0gIGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlKzB4MTE1LzB4MTUwIFthbWRn
cHVdCj4gWyAzNjc2LjAzMzc0M10gIGFtZGdwdV9jc19pb2N0bCsweDg3My8weDIwYTAgW2FtZGdw
dV0KPiBbIDM2NzYuMDMzOTYwXSAgZHJtX2lvY3RsX2tlcm5lbCsweGI4LzB4MTQwIFtkcm1dCj4g
WyAzNjc2LjAzMzk3N10gIGRybV9pb2N0bCsweDIyMi8weDNjMCBbZHJtXQo+IFsgMzY3Ni4wMzQw
NzFdICBhbWRncHVfZHJtX2lvY3RsKzB4NDkvMHg4MCBbYW1kZ3B1XQo+IFsgMzY3Ni4wMzQxNDVd
ICBfX3g2NF9zeXNfaW9jdGwrMHg4My8weGIwCj4gWyAzNjc2LjAzNDE0OV0gIGRvX3N5c2NhbGxf
NjQrMHgzMy8weDQwCj4g4oCmCj4gWyAzNjc2LjAzNDE3MV0gLS0tWyBlbmQgdHJhY2UgNjZlOTg2
NWIwMjcxMTJmMyBdLS0tCj4gYGBgCj4KPiBUaGFua3MuCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
