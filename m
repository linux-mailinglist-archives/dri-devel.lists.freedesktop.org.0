Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176B11EDF12
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 10:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982506E2A8;
	Thu,  4 Jun 2020 08:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD11E6E2A8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 08:10:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8FaUbN16F4hVKPV3Cs+NofAQKfr3G9JOOe+lA+dQRY/dAvT/f7siDYaJ2UheRXBACjfpDp/L79GK8EL79hJPnVXZg8YBFQppyHCbOXDVnNWAGUNdir755+FtllGMH8vW+BG8vp6ubmMwd8bIcsP6l/G3LWmLWeV8hH4LU8/ibZ/Ryeukstqdh1uC21zVHdmB9IZuEgIna4WVYMWgjIUfl0sArfBUiR+mfBcZeKrMm134515xKrw7fKbktrF22EnhqBo897S98OYvcohuvYl8Te5uov2FkPyfts/lPSE6bQ9YbEWFlTi/DCDP4aeVtofCIMt+tou6rmar2oDzfwKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1FQBVwTIh2JL4CTF5vKMLW8CRYVQXKXzk5NabPlOiw=;
 b=iwfivsNiyZfz78Z88JZiX4hwJ0QQ3qfUrpH3K5NDQeCkA834o//HB2s/A9erXesvsaP/HPZWOCtv7yQR/p4gMY5sVjZ3dihexYsQU0uy7E4IugPV9gQt4yDaswgaRROc82ftXCqSiXF0yIG8eSVT2Wtr1rImbd0ymfI3O4ZiyCV/8IDGr7d3GPBV8K6InBpyCUXiGN/L6ZTBEUOzu+gCJX8ybkkSEWlmi3K5qGpvTsAYftqNdRgVyJpHq5AThvDZODMBo9FGh83e9UoAQzTX5yRD+1IBeWAfUy1OWT2NsJ+1dJf6a0ZRHYhywULIo6J0bThdi0saZLxTljVuK/8yFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1FQBVwTIh2JL4CTF5vKMLW8CRYVQXKXzk5NabPlOiw=;
 b=pM0whOYmdLgP99W5nRlkHXXfrQqesGbGl9kQ4ymn8JyRj5E31VDNypX652axUY68U11WwJvCRtheTY883QP+zY3nWEL1W7mGtfnGA4Tpt1CyXPczk16fVvxZ60JWB0CS66eq6p6K+k8mhULNKVpEt7/sILWmrbZLh+OKh/koaXk=
Authentication-Results: deltatee.com; dkim=none (message not signed)
 header.d=none;deltatee.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3611.namprd12.prod.outlook.com (2603:10b6:5:3c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Thu, 4 Jun
 2020 08:10:33 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%5]) with mapi id 15.20.3066.019; Thu, 4 Jun 2020
 08:10:33 +0000
Subject: Re: [git pull] drm for 5.8-rc1
To: Jason Gunthorpe <jgg@mellanox.com>, Dave Airlie <airlied@gmail.com>,
 Christoph Hellwig <hch@infradead.org>
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200603201337.GA225528@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1d1ad025-e215-da23-5282-bbaf154fa979@amd.com>
Date: Thu, 4 Jun 2020 10:10:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200603201337.GA225528@ziepe.ca>
Content-Language: en-US
X-ClientProxiedBy: AM4PR07CA0005.eurprd07.prod.outlook.com
 (2603:10a6:205:1::18) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0005.eurprd07.prod.outlook.com (2603:10a6:205:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.7 via Frontend Transport; Thu, 4 Jun 2020 08:10:31 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9f26b887-df6b-4030-6fb6-08d8085ec117
X-MS-TrafficTypeDiagnostic: DM6PR12MB3611:
X-Microsoft-Antispam-PRVS: <DM6PR12MB361101FE504EEA10C3EC771583890@DM6PR12MB3611.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 04244E0DC5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ra1+7c/4Mpt2cQyLUATDsjPB/qHKe8IyuE+DBOHCH4eH2QH/6D/CBz81qRYOfYl1CqtcFNgA2+ssC+5kBJftw/b8SvL+p4yAN31q8pQLL7IRBOMtuZtyH/mqYnYWPXkIK5vh5kwUyw2mIHzbyb2HWVyKYx/e2ojp85bOzWOcnU0YCVYv5XnXesZ+Gv1w1VODo5uj3W2z9BB78MZp2XoNXyzHB3hqQGOUwUrdOS1xkLoP+zKLyA4etxcOf1JVy5UkdXFNODtwPy/ijPd0tiYkHaDlkwzRja1+kqkmMpiVNvfBGtuzeyJb7nVtxx3ENbAOQYSmPndmjmLRjK+PG4RLppbh4/mGuNphjvkL0k+lGlzrujB1HzRzGaoaaft8kbyfHnBxLwq3NuJdXvxI6y2BnsUhH/xDr0je9hDAZtgEuYorm0oH5obQ0XTv1vpVEhuD2rhrAdRe5kaQJmO8l4sLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(4326008)(54906003)(110136005)(186003)(86362001)(2616005)(83380400001)(2906002)(31686004)(478600001)(45080400002)(16526019)(66946007)(8676002)(966005)(52116002)(6486002)(66476007)(8936002)(5660300002)(66556008)(31696002)(36756003)(6666004)(66574014)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: dEDPAkv7adSKLQjREIKG5SNV5R2s4VaOhT5r5J8i5G13mFdCTSYGxcGe3GHFfBM7AIQEmVUu6X0EMS0qpPFrzOfvrQoRopdLso1L2qXz3XFTh+QkojFNJMXz2IqoJRR1ug0PSEFz2vvFygwtH2FgETJffPCZJHXoYU9BY43yIPfHF5RVnag+XiVG6ZuGI0Dlw07LoowxhskYFuJR7uZevECXH6p/MXrDHtivMQAj9VEhpB/p3WH4DRLQ/OBsfeAcVsQoI0wedW8zHDFKzkOOq0VFjy9P11Ua/BnRGzdl5/AhrjFmshjZVsjFoCb01mEO7Mg+OmFLWWlQH5W6ZTNK1ERgtBN/zi2rYNT7Dx6FgABFQfyLEE+7gBSyAkxX7p7UccnEkyLSejy2b98bMb45B9JzloBvf6Pgih0gEDvR6YUHDY1PqJhyRmedU9NTI2FananPnrRihPZnJXvmVKYSsmgE8szhbZ9rFvYLAtkK1vzql2SbbTSqtlwfqvWt65LENdQTxVmh809KxDe+UaUjmjXqmqaoWkiEWWDAxaLZxha8dd9z2CCfHZh2Fw2B5a/q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f26b887-df6b-4030-6fb6-08d8085ec117
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2020 08:10:33.4144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qds2ufUuh39z9ka6r08LpZjfbqgFRXBQCGerjhMAiVF/liVE6TUiArTJWouJXyBR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3611
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Logan Gunthorpe <logang@deltatee.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDMuMDYuMjAgdW0gMjI6MTMgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gVHVlLCBK
dW4gMDIsIDIwMjAgYXQgMDQ6MDY6MzJQTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4+IEhp
IExpbnVzLAo+Pgo+PiBUaGlzIGlzIHRoZSBtYWluIGRybSBwdWxsIHJlcXVlc3QgZm9yIDUuOC1y
YzEuCj4+Cj4+IEhpZ2hsaWdodHM6Cj4+IENvcmUgRFJNIGhhZCBhIGxvdCBvZiByZWZhY3Rvcmlu
ZyBhcm91bmQgbWFuYWdlZCBkcm0gcmVzb3VyY2VzIHRvIG1ha2UKPj4gZHJpdmVycyBzaW1wbGVy
Lgo+PiBJbnRlbCBUaWdlcmxha2Ugc3VwcG9ydCBpcyBvbiBieSBkZWZhdWx0Cj4+IGFtZGdwdSBu
b3cgc3VwcG9ydCBwMnAgUENJIGJ1ZmZlciBzaGFyaW5nIGFuZCBlbmNyeXB0ZWQgR1BVIG1lbW9y
eQo+IENocmlzdG9waCBIZWxsd2lnIGJhc2ljYWxseSBOQUsnZCB0aGlzIGFwcHJvYWNoLCB3aHkg
aXMgaXQgZ2V0dGluZwo+IG1lcmdlZCBhbGwgb2YgYSBzdWRkZW4/PwoKRGF2ZSBhbmQgRGFuaWVs
IGV4cGxpY2l0bHkgc2FpZCB0aGV5IHdhbnQgdG8gaGF2ZSB0aGlzIGFuZCBpdCBpcyBvayBhcyAK
bG9uZyBhcyBJIG9wZW4gY29kZSBpdCBpbiB0aGUgZHJpdmVyIGFuZCBrZWVwIGl0IEFNRCBpbnRl
cm5hbC4KCldlIGhhdmUgdGhhdCBpbiBkaXNjdXNzaW9uIGZvciB5ZWFycyBub3cgYW5kIGNvbnN0
cnVjdGluZy91c2luZyB0aGUgc2cgCnRhYmxlIGlzIGFjdHVhbGx5IG9ubHkgdGhlIHZlcnkgbWlu
b3IgcGllY2Ugb2YgaXQuIE9uIHRoZSBvdGhlciBoYW5kIAp0aGVyZSBpcyBhIGxvdCBvZiB3b3Jr
IHVuZGVyd2F5IHRvIGdldCByaWQgb2YgYWJ1c2luZyB0aGUgc2cgdGFibGVzIGFzIHdlbGwuCgo+
Cj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGaW50ZWwtZ2Z4JTJGMjAyMDAzMTExNTI4Mzgu
R0EyNDI4MCU0MGluZnJhZGVhZC5vcmclMkYmYW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5r
b2VuaWclNDBhbWQuY29tJTdDNTViMjM4YjkxMDRkNGE4ZDRmZWIwOGQ4MDdmYWExMWMlN0MzZGQ4
OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MjY4MTIwMzE1NzA2MDYz
JmFtcDtzZGF0YT1BZ1ZKNDUlMkZ0JTJGVllreUlHSUdnTXJvcDY5WExRUmVMRHBGMGFoTDVyakVq
byUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Cj4gQXJlIHdlIG5vdyBPSyB3aXRoIHRoaXMgc2FtZSBhcHBy
b2FjaCBvcGVuIGNvZGVkIGluIGEgZHJpdmVyPwoKSW50ZWwgaXMgYXBwYXJlbnRseSBkb2luZyB0
aGlzIGFzIHdlbGwgZm9yIHllYXJzLCBzZWUgdGhlIGk5MTUgZHJpdmVyIAppbnRlcm5hbHMuCgo+
IFRoaXMgd2Fzbid0IENjJ2QgdG8gdGhlIHVzdWFsIHBlb3BsZSBkb2luZyB3b3JrIGluIHRoaXMg
UENJIFAyUCBhcmVhPz8KCkkgY2VydGFpbmx5IHByZWZlciBhIGNvbW1vbiBmcmFtZXdvcmsgZm9y
IHRoaXMsIGJ1dCB3aGVuIG15IHVwc3RyZWFtIAptYWludGFpbmVyIHNheXMgaGUgd2FudHMgdG8g
dGFrZSB0aGlzIHdobyBhbSBJIHRvIG9iamVjdD8KCkNocmlzdGlhbi4KCj4KPiBTZWUKPgo+IGNv
bW1pdCBmNDRmZmQ2NzdmYjM1NjJhYzBhMWZmOWM4YWU1MjY3MmJlNzQxZjAwCj4gQXV0aG9yOiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gRGF0ZTogICBGcmkg
TWFyIDIzIDE2OjU2OjM3IDIwMTggKzAxMDAKPgo+ICAgICAgZHJtL2FtZGdwdTogYWRkIHN1cHBv
cnQgZm9yIGV4cG9ydGluZyBWUkFNIHVzaW5nIERNQS1idWYgdjMKPiAgICAgIAo+ICAgICAgV2Ug
c2hvdWxkIGJlIGFibGUgdG8gZG8gdGhpcyBub3cgYWZ0ZXIgY2hlY2tpbmcgYWxsIHRoZSBwcmVy
ZXF1aXNpdGVzLgo+ICAgICAgCj4gICAgICB2MjogZml4IGVudHJpZSBjb3VudCBpbiB0aGUgc2d0
Cj4gICAgICB2MzogbWFudWFsbHkgY29uc3RydWN0IHRoZSBzZwo+ICAgICAgCj4gICAgICBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g
ICAgICBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAg
ICAgIEFja2VkLWJ5OiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+ICAg
ICAgTGluazogaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZyUyRnBhdGNoJTJGMzU5
Mjk1JmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzU1YjIz
OGI5MTA0ZDRhOGQ0ZmViMDhkODA3ZmFhMTFjJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0
ZTE4M2QlN0MwJTdDMCU3QzYzNzI2ODEyMDMxNTcwNjA2MyZhbXA7c2RhdGE9WXpOdnhCVk9mNWhj
VW01S2pPenpWJTJGY0hHNWpkR0VZbXJJNzZQUU45djNVJTNEJmFtcDtyZXNlcnZlZD0wCj4KPiBb
Li5dCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zy
YW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+
IGluZGV4IDgyYTMyOTllNTNjMDQyLi4xMjhhNjY3ZWQ4ZmEwZCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4gQEAgLTIyLDYgKzIyLDcgQEAK
PiAgICAqIEF1dGhvcnM6IENocmlzdGlhbiBLw7ZuaWcKPiAgICAqLwo+ICAgCj4gKyNpbmNsdWRl
IDxsaW51eC9kbWEtbWFwcGluZy5oPgo+ICAgI2luY2x1ZGUgImFtZGdwdS5oIgo+ICAgI2luY2x1
ZGUgImFtZGdwdV92bS5oIgo+ICAgI2luY2x1ZGUgImFtZGdwdV9hdG9tZmlybXdhcmUuaCIKPiBA
QCAtNDU4LDYgKzQ1OSwxMDQgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3ZyYW1fbWdyX2RlbChzdHJ1
Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiAgIAltZW0tPm1tX25vZGUgPSBOVUxMOwo+
ICAgfQo+ICAgCj4gKy8qKgo+ICsgKiBhbWRncHVfdnJhbV9tZ3JfYWxsb2Nfc2d0IC0gYWxsb2Nh
dGUgYW5kIGZpbGwgYSBzZyB0YWJsZQo+ICsgKgo+ICsgKiBAYWRldjogYW1kZ3B1IGRldmljZSBw
b2ludGVyCj4gKyAqIEBtZW06IFRUTSBtZW1vcnkgb2JqZWN0Cj4gKyAqIEBkZXY6IHRoZSBvdGhl
ciBkZXZpY2UKPiArICogQGRpcjogZG1hIGRpcmVjdGlvbgo+ICsgKiBAc2d0OiByZXN1bHRpbmcg
c2cgdGFibGUKPiArICoKPiArICogQWxsb2NhdGUgYW5kIGZpbGwgYSBzZyB0YWJsZSBmcm9tIGEg
VlJBTSBhbGxvY2F0aW9uLgo+ICsgKi8KPiAraW50IGFtZGdwdV92cmFtX21ncl9hbGxvY19zZ3Qo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gKwkJCSAgICAgIHN0cnVjdCB0dG1fbWVtX3Jl
ZyAqbWVtLAo+ICsJCQkgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gKwkJCSAgICAgIGVudW0g
ZG1hX2RhdGFfZGlyZWN0aW9uIGRpciwKPiArCQkJICAgICAgc3RydWN0IHNnX3RhYmxlICoqc2d0
KQo+ICt7Cj4gKwlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGU7Cj4gKwlzdHJ1Y3Qgc2NhdHRlcmxp
c3QgKnNnOwo+ICsJaW50IG51bV9lbnRyaWVzID0gMDsKPiArCXVuc2lnbmVkIGludCBwYWdlczsK
PiArCWludCBpLCByOwo+ICsKPiArCSpzZ3QgPSBrbWFsbG9jKHNpemVvZigqc2cpLCBHRlBfS0VS
TkVMKTsKPiArCWlmICghKnNndCkKPiArCQlyZXR1cm4gLUVOT01FTTsKPiArCj4gKwlmb3IgKHBh
Z2VzID0gbWVtLT5udW1fcGFnZXMsIG5vZGUgPSBtZW0tPm1tX25vZGU7Cj4gKwkgICAgIHBhZ2Vz
OyBwYWdlcyAtPSBub2RlLT5zaXplLCArK25vZGUpCj4gKwkJKytudW1fZW50cmllczsKPiArCj4g
KwlyID0gc2dfYWxsb2NfdGFibGUoKnNndCwgbnVtX2VudHJpZXMsIEdGUF9LRVJORUwpOwo+ICsJ
aWYgKHIpCj4gKwkJZ290byBlcnJvcl9mcmVlOwo+ICsKPiArCWZvcl9lYWNoX3NnKCgqc2d0KS0+
c2dsLCBzZywgbnVtX2VudHJpZXMsIGkpCj4gKwkJc2ctPmxlbmd0aCA9IDA7Cj4gKwo+ICsJbm9k
ZSA9IG1lbS0+bW1fbm9kZTsKPiArCWZvcl9lYWNoX3NnKCgqc2d0KS0+c2dsLCBzZywgbnVtX2Vu
dHJpZXMsIGkpIHsKPiArCQlwaHlzX2FkZHJfdCBwaHlzID0gKG5vZGUtPnN0YXJ0IDw8IFBBR0Vf
U0hJRlQpICsKPiArCQkJYWRldi0+Z21jLmFwZXJfYmFzZTsKPiArCQlzaXplX3Qgc2l6ZSA9IG5v
ZGUtPnNpemUgPDwgUEFHRV9TSElGVDsKPiArCQlkbWFfYWRkcl90IGFkZHI7Cj4gKwo+ICsJCSsr
bm9kZTsKPiArCQlhZGRyID0gZG1hX21hcF9yZXNvdXJjZShkZXYsIHBoeXMsIHNpemUsIGRpciwK
PiArCQkJCQlETUFfQVRUUl9TS0lQX0NQVV9TWU5DKTsKPiArCQlyID0gZG1hX21hcHBpbmdfZXJy
b3IoZGV2LCBhZGRyKTsKPiArCQlpZiAocikKPiArCQkJZ290byBlcnJvcl91bm1hcDsKPiArCj4g
KwkJc2dfc2V0X3BhZ2Uoc2csIE5VTEwsIHNpemUsIDApOwo+ICsJCXNnX2RtYV9hZGRyZXNzKHNn
KSA9IGFkZHI7Cj4gKwkJc2dfZG1hX2xlbihzZykgPSBzaXplOwo+ICAgICAgICAgICAgICAgICAg
Xl5eXl5eXl5eXl5eXl4KPiAgICAKPiBKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
