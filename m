Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B59321683
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 11:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EEC89872;
	Fri, 17 May 2019 09:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720077.outbound.protection.outlook.com [40.107.72.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE8089872
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 09:47:28 +0000 (UTC)
Received: from DM3PR12CA0058.namprd12.prod.outlook.com (2603:10b6:0:56::26) by
 CY4PR1201MB0056.namprd12.prod.outlook.com (2603:10b6:910:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Fri, 17 May
 2019 09:47:26 +0000
Received: from DM3NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by DM3PR12CA0058.outlook.office365.com
 (2603:10b6:0:56::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Fri, 17 May 2019 09:47:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT046.mail.protection.outlook.com (10.152.83.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Fri, 17 May 2019 09:47:26 +0000
Received: from [10.237.74.158] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Fri, 17 May
 2019 04:47:24 -0500
Subject: Re: [PATCH libdrm] enable syncobj test depending on capability
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
References: <20190516104642.21450-1-david1.zhou@amd.com>
 <278437b6-c5f0-209b-443b-573b4143f944@amd.com>
 <-yw2q6u7xkjpo-i83eg9msudz1wgjn7w-b101h0-sfv5ag1noxjz2wg54r-iuw7ml-f519uls55cqypexnfa-et96uc-nx96jg5fu1d3-wn1hxg-td9bpo5n1nbv-wmnwfr84y609mm8lnpxqaf92-n4k5l3.1558004611599@email.android.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <144963b9-d1e5-2afb-c02e-58dd6ba19a3e@amd.com>
Date: Fri, 17 May 2019 17:47:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <-yw2q6u7xkjpo-i83eg9msudz1wgjn7w-b101h0-sfv5ag1noxjz2wg54r-iuw7ml-f519uls55cqypexnfa-et96uc-nx96jg5fu1d3-wn1hxg-td9bpo5n1nbv-wmnwfr84y609mm8lnpxqaf92-n4k5l3.1558004611599@email.android.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39860400002)(376002)(136003)(2980300002)(428003)(13464003)(199004)(189003)(36756003)(33964004)(8936002)(76176011)(71190400001)(77096007)(478600001)(26005)(65826007)(81166006)(16586007)(3846002)(6116002)(81156014)(64126003)(72206003)(316002)(6246003)(186003)(7736002)(2501003)(68736007)(446003)(486006)(86152003)(476003)(58126008)(11346002)(70206006)(126002)(336012)(8676002)(70586007)(2616005)(16576012)(53936002)(65956001)(6666004)(110136005)(37036004)(229853002)(236005)(65806001)(16526019)(84326002)(356004)(2906002)(31696002)(31686004)(426003)(54896002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0056; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e2a7109-9314-4f37-abce-08d6daacab6b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0056; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0056:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0056274CDC4B56B84CC16DF6B40B0@CY4PR1201MB0056.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 0040126723
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tT5CBk5VPXwX62upGGh1fCMmLukBN0edXuIElCBwLimwJpQnNA6m1rs7e8RC3RK1r422mb5rzx0+dzMLmUQhAXnZ2BH6bC7auYjE506MvQ2keihRlNCsUJG5op1sSf2CJrkpQyE76n9O2tgjXBdqu+Q8cwB20oatw2laSK6Cp1ijAF32m8urLlTEzfPJztH1LGv8djBTWhMss+U28qWituPmEDJtuxBH54CHnlyuDBIxYzyvBwhFIN1pnaiS0NhvKANx3a89yZjIDJ8Zealj7tkjzn2qGLIsKDVntNUXIF9+ensQptsq0VRyZbJPULAbrX2Rt59B9TfhbYebBScRGhdL1/sjZ6YwLo3Smv8tnibQllCKI+8wuvW/1/uPjjFI05s6gK64KoE9+ODpG9Awt78nbcQeSW+oNIixgDXQr7c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2019 09:47:26.3369 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2a7109-9314-4f37-abce-08d6daacab6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0056
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6i4Q9jCbQtwWtiFXjEEUZXWybIs0TTejvHY/rZkmwg=;
 b=xbVKD64tLckMvz4HOi/5ZuoJ9hM2dsrsIDMTpoqla8z5yRcUPeCsoaTPrvAb0tc9ONlqQ/KpFNl8UhIfkTbFCRixwzqE2jOlg+YZUb+3sxd6+jzizVPAZbvXeigPWgF2BCq0+7ZtUKZ3pZRGyJJCSfXytEgN/jYiSOc8zfUuWNk=
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
Content-Type: multipart/mixed; boundary="===============0252345197=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0252345197==
Content-Type: multipart/alternative;
	boundary="------------657380E83A7BB613CE8EF6A6"
Content-Language: en-US

--------------657380E83A7BB613CE8EF6A6
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping, Could you help check in patch to gitlab? My connection to gitlab 
still has problem.


Thanks,

-David


On 2019年05月16日 19:03, Zhou, David(ChunMing) wrote:
> could you help push this patch as well?
>
> Thanks,
> -David
>
> -------- Original Message --------
> Subject: Re: [PATCH libdrm] enable syncobj test depending on capability
> From: "Koenig, Christian"
> To: "Zhou, David(ChunMing)" ,dri-devel@lists.freedesktop.org
> CC:
>
> Am 16.05.19 um 12:46 schrieb Chunming Zhou:
> > Feature is controlled by DRM_CAP_SYNCOBJ_TIMELINE drm capability.
> >
> > Signed-off-by: Chunming Zhou <david1.zhou@amd.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> > ---
> >   include/drm/drm.h            | 1 +
> >   tests/amdgpu/syncobj_tests.c | 8 ++++++++
> >   2 files changed, 9 insertions(+)
> >
> > diff --git a/include/drm/drm.h b/include/drm/drm.h
> > index c893f3b4..532787bf 100644
> > --- a/include/drm/drm.h
> > +++ b/include/drm/drm.h
> > @@ -643,6 +643,7 @@ struct drm_gem_open {
> >   #define DRM_CAP_PAGE_FLIP_TARGET    0x11
> >   #define DRM_CAP_CRTC_IN_VBLANK_EVENT        0x12
> >   #define DRM_CAP_SYNCOBJ             0x13
> > +#define DRM_CAP_SYNCOBJ_TIMELINE     0x14
> >
> >   /** DRM_IOCTL_GET_CAP ioctl argument type */
> >   struct drm_get_cap {
> > diff --git a/tests/amdgpu/syncobj_tests.c b/tests/amdgpu/syncobj_tests.c
> > index a0c627d7..869ed88e 100644
> > --- a/tests/amdgpu/syncobj_tests.c
> > +++ b/tests/amdgpu/syncobj_tests.c
> > @@ -22,6 +22,7 @@
> >   */
> >
> >   #include "CUnit/Basic.h"
> > +#include "xf86drm.h"
> >
> >   #include "amdgpu_test.h"
> >   #include "amdgpu_drm.h"
> > @@ -36,6 +37,13 @@ static void amdgpu_syncobj_timeline_test(void);
> >
> >   CU_BOOL suite_syncobj_timeline_tests_enable(void)
> >   {
> > +     int r;
> > +     uint64_t cap = 0;
> > +
> > +     r = drmGetCap(drm_amdgpu[0], DRM_CAP_SYNCOBJ_TIMELINE, &cap);
> > +     if (r || cap == 0)
> > +             return CU_FALSE;
> > +
> >        return CU_TRUE;
> >   }
> >
>


--------------657380E83A7BB613CE8EF6A6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>ping, Could you help check in patch to gitlab? My connection to
      gitlab still has problem.</p>
    <p><br>
    </p>
    <p>Thanks,<br>
    </p>
    <p>-David<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2019年05月16日 19:03, Zhou,
      David(ChunMing) wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:-yw2q6u7xkjpo-i83eg9msudz1wgjn7w-b101h0-sfv5ag1noxjz2wg54r-iuw7ml-f519uls55cqypexnfa-et96uc-nx96jg5fu1d3-wn1hxg-td9bpo5n1nbv-wmnwfr84y609mm8lnpxqaf92-n4k5l3.1558004611599@email.android.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <meta name="Generator" content="Microsoft Exchange Server">
      <!-- converted from text -->
      <style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800000 2px solid; } --></style>
      <div>could you help push this patch as well?<br>
        <br>
        Thanks,<br>
        -David<br>
        <br>
        -------- Original Message --------<br>
        Subject: Re: [PATCH libdrm] enable syncobj test depending on
        capability<br>
        From: "Koenig, Christian" <br>
        To: "Zhou, David(ChunMing)" ,<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a><br>
        CC: <br>
        <br>
      </div>
      <font size="2"><span style="font-size:11pt;">
          <div class="PlainText">Am 16.05.19 um 12:46 schrieb Chunming
            Zhou:<br>
            &gt; Feature is controlled by DRM_CAP_SYNCOBJ_TIMELINE drm
            capability.<br>
            &gt;<br>
            &gt; Signed-off-by: Chunming Zhou
            <a class="moz-txt-link-rfc2396E" href="mailto:david1.zhou@amd.com">&lt;david1.zhou@amd.com&gt;</a><br>
            <br>
            Reviewed-by: Christian König
            <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
            <br>
            &gt; ---<br>
            &gt;   include/drm/drm.h            | 1 +<br>
            &gt;   tests/amdgpu/syncobj_tests.c | 8 ++++++++<br>
            &gt;   2 files changed, 9 insertions(+)<br>
            &gt;<br>
            &gt; diff --git a/include/drm/drm.h b/include/drm/drm.h<br>
            &gt; index c893f3b4..532787bf 100644<br>
            &gt; --- a/include/drm/drm.h<br>
            &gt; +++ b/include/drm/drm.h<br>
            &gt; @@ -643,6 +643,7 @@ struct drm_gem_open {<br>
            &gt;   #define DRM_CAP_PAGE_FLIP_TARGET    0x11<br>
            &gt;   #define DRM_CAP_CRTC_IN_VBLANK_EVENT        0x12<br>
            &gt;   #define DRM_CAP_SYNCOBJ             0x13<br>
            &gt; +#define DRM_CAP_SYNCOBJ_TIMELINE     0x14<br>
            &gt;   <br>
            &gt;   /** DRM_IOCTL_GET_CAP ioctl argument type */<br>
            &gt;   struct drm_get_cap {<br>
            &gt; diff --git a/tests/amdgpu/syncobj_tests.c
            b/tests/amdgpu/syncobj_tests.c<br>
            &gt; index a0c627d7..869ed88e 100644<br>
            &gt; --- a/tests/amdgpu/syncobj_tests.c<br>
            &gt; +++ b/tests/amdgpu/syncobj_tests.c<br>
            &gt; @@ -22,6 +22,7 @@<br>
            &gt;   */<br>
            &gt;   <br>
            &gt;   #include "CUnit/Basic.h"<br>
            &gt; +#include "xf86drm.h"<br>
            &gt;   <br>
            &gt;   #include "amdgpu_test.h"<br>
            &gt;   #include "amdgpu_drm.h"<br>
            &gt; @@ -36,6 +37,13 @@ static void
            amdgpu_syncobj_timeline_test(void);<br>
            &gt;   <br>
            &gt;   CU_BOOL suite_syncobj_timeline_tests_enable(void)<br>
            &gt;   {<br>
            &gt; +     int r;<br>
            &gt; +     uint64_t cap = 0;<br>
            &gt; +<br>
            &gt; +     r = drmGetCap(drm_amdgpu[0],
            DRM_CAP_SYNCOBJ_TIMELINE, &amp;cap);<br>
            &gt; +     if (r || cap == 0)<br>
            &gt; +             return CU_FALSE;<br>
            &gt; +<br>
            &gt;        return CU_TRUE;<br>
            &gt;   }<br>
            &gt;   <br>
            <br>
          </div>
        </span></font>
    </blockquote>
    <br>
  </body>
</html>

--------------657380E83A7BB613CE8EF6A6--

--===============0252345197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0252345197==--
