Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDEB2904E
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 07:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DE56E086;
	Fri, 24 May 2019 05:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750079.outbound.protection.outlook.com [40.107.75.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCB86E086
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 05:16:02 +0000 (UTC)
Received: from DM3PR12CA0050.namprd12.prod.outlook.com (2603:10b6:0:56::18) by
 DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:4a::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Fri, 24 May 2019 05:16:00 +0000
Received: from DM3NAM03FT065.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM3PR12CA0050.outlook.office365.com
 (2603:10b6:0:56::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Fri, 24 May 2019 05:16:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT065.mail.protection.outlook.com (10.152.82.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Fri, 24 May 2019 05:16:00 +0000
Received: from [10.237.74.158] (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server (TLS) id 14.3.389.1; Fri, 24 May
 2019 00:15:59 -0500
Subject: Re: [PATCH 1/2] update drm.h
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "michel@daenzer.net" <michel@daenzer.net>
References: <20190522090800.15908-1-david1.zhou@amd.com>
 <17e558ac-bda8-0541-b102-2fd730ce4753@amd.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <f95b85cd-80ee-576a-248a-409f512e8d38@amd.com>
Date: Fri, 24 May 2019 13:15:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <17e558ac-bda8-0541-b102-2fd730ce4753@amd.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(136003)(396003)(2980300002)(428003)(189003)(199004)(65826007)(6246003)(2870700001)(50466002)(316002)(68736007)(65806001)(65956001)(336012)(31696002)(76176011)(31686004)(126002)(53936002)(486006)(70206006)(16576012)(2486003)(23676004)(5660300002)(6116002)(3846002)(70586007)(2501003)(426003)(356004)(7736002)(11346002)(446003)(81156014)(305945005)(2906002)(8676002)(86152003)(81166006)(2616005)(67846002)(476003)(8936002)(64126003)(6666004)(229853002)(110136005)(478600001)(58126008)(36756003)(186003)(16526019)(2201001)(26005)(77096007)(47776003)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2667; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcc99351-51c1-4e6d-cd83-08d6e006e92c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:DM6PR12MB2667; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2667072F2868E6C7D3792B03B4020@DM6PR12MB2667.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-Forefront-PRVS: 0047BC5ADE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xDueTbnBc7dMeVwSRkeejqDJvErnnKL0Fta3/PCUQMO1jhuft0t/chkwrxwcwAyVlBfnyEfo79EWrcWOOS/1nrNPhjwKY+a5CQzyPBqvDQQJWxTSJgpNcHMZQ6FqfQEAsKXRJNbb4WtrZ0khBpwhAyXzYTf+VvGdfyWVahs22032hoIWpmvTB5Wh0P2XiItyDwelb6MSo/dEldbTF7m4LQyoMJsaqc/UxRx9HHJv+crCE3qHvYKDwh5pSyc1+/pe/q1UvWtjdtFq7qyVRPAkm94yJXLt31zC9Ap2qcZPip0x1unqFl1o4uGNpdnThf/Lwl/8H2cnrm/7a4aqALv5aVGEmfeUUNmgyu/scsGpgiLL2PrrW+OsSIXwZ2OREH55tWmbJhEUixiVaRVi59zjdeaZZCT6RsVgJ+FfL5K/KEI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2019 05:16:00.4315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc99351-51c1-4e6d-cd83-08d6e006e92c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7b6B9AyyboBvVpRb8e7feRrkJ+vb/0vPQh2f94QZvWY=;
 b=uU+7rCU0L3UdrXKuXZqb6FPQJWU/KGK6MRM0onazEMuh023UKb8Ipv5kf6oiAxbEqU9gx+OpR+8T4Dud2Zq2vKZn8BJ/VUEpeCTD0Gfp+wv9BPVHolRgIKfaLf+l3dz+rPHk1cXeyRlf3zib9fFJt7eyYz6GybTAyk43yWGCzJ0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

YW55b25lIGNhbiBwaWNrIHVwIHRvIGdpdGxhYiBmb3IgbGliZHJtPwoKClRoYW5rcywKCi1EYXZp
ZAoKCk9uIDIwMTnlubQwNeaciDIy5pelIDE4OjQ2LCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToK
PiBBbSAyMi4wNS4xOSB1bSAxMTowNyBzY2hyaWViIENodW5taW5nIFpob3U6Cj4+ICAgICAgYSkg
ZGVsdGE6IG9ubHkgRFJNX0NBUF9TWU5DT0JKX1RJTUVMSU5FCj4+ICAgICAgYikgR2VuZXJhdGVk
IHVzaW5nIG1ha2UgaGVhZGVyc19pbnN0YWxsLgo+PiAgICAgIGMpIEdlbmVyYXRlZCBmcm9tIG9y
aWdpbi9kcm0tbWlzYy1uZXh0IGNvbW1pdCA5ODJjMDUwMGZkMWE4MDEyYzMxZDNjOWRkOGRlMjg1
MTI5OTA0NjU2Igo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhv
dUBhbWQuY29tPgo+PiBTdWdnZXN0ZWQtYnk6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnpl
ci5uZXQ+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPgo+PiAtLS0KPj4gICAgaW5jbHVkZS9kcm0vZHJtLmggfCAyICsrCj4+ICAgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybS5oIGIvaW5jbHVkZS9kcm0vZHJtLmgKPj4gaW5kZXggYzg5M2YzYjQuLjQzOGFiZGUz
IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm0uaAo+PiArKysgYi9pbmNsdWRlL2RybS9k
cm0uaAo+PiBAQCAtNDQsNiArNDQsNyBAQCB0eXBlZGVmIHVuc2lnbmVkIGludCBkcm1faGFuZGxl
X3Q7Cj4+ICAgIAo+PiAgICAjZWxzZSAvKiBPbmUgb2YgdGhlIEJTRHMgKi8KPj4gICAgCj4+ICsj
aW5jbHVkZSA8c3RkaW50Lmg+Cj4+ICAgICNpbmNsdWRlIDxzeXMvaW9jY29tLmg+Cj4+ICAgICNp
bmNsdWRlIDxzeXMvdHlwZXMuaD4KPj4gICAgdHlwZWRlZiBpbnQ4X3QgICBfX3M4Owo+PiBAQCAt
NjQzLDYgKzY0NCw3IEBAIHN0cnVjdCBkcm1fZ2VtX29wZW4gewo+PiAgICAjZGVmaW5lIERSTV9D
QVBfUEFHRV9GTElQX1RBUkdFVAkweDExCj4+ICAgICNkZWZpbmUgRFJNX0NBUF9DUlRDX0lOX1ZC
TEFOS19FVkVOVAkweDEyCj4+ICAgICNkZWZpbmUgRFJNX0NBUF9TWU5DT0JKCQkweDEzCj4+ICsj
ZGVmaW5lIERSTV9DQVBfU1lOQ09CSl9USU1FTElORQkweDE0Cj4+ICAgIAo+PiAgICAvKiogRFJN
X0lPQ1RMX0dFVF9DQVAgaW9jdGwgYXJndW1lbnQgdHlwZSAqLwo+PiAgICBzdHJ1Y3QgZHJtX2dl
dF9jYXAgewoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
