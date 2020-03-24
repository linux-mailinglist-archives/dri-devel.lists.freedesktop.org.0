Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DCF190AFC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 11:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546C089C1F;
	Tue, 24 Mar 2020 10:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAA289BF4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 10:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHZPajcjF/KZUY4+eJXddzjs6LCJiZtPnN35g6IR8k5ZMPQoLC1GBrSwYePl7LPidQoloI2/8QSw9qPxdDTfUAiTVpoCYXfKGkoCyNPDchB6XbkkEhd/yy6xC1kVpQDhZRisQdQROh5Y47tpZYO/eZ99uaC8FFAWQUOU5b4cpNtkNXKaOArTbqP31rBLbmUELm+zxQYzfM3i8enZo7r5BA6knuVBgcYz6ZBVgZeQAPYpcvsl2E0o6tmG0UU9cAf2+hlXg1Z/GgpasWPacdZY+zeyMvaytkrYkJCoOUy2bpvgbnBAqH5dJSOa2JFchwydDF7rYu3FGR9Kgtiojd+qXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI3659Sm+BqV5w+u7eJ1S3NSEdTHXQq+SGnvz9oBuxk=;
 b=Po6fpKnuieof81xyU+7eHUq8OpNVkCRSib7pc1nEB9l14ApS9ukFBECOv9WWavAtPaafYpKQCQI8EqGKB4QGC6ve9N84D08JUke1WaXq3d9ewSmfU35l+3UF9cNKp23ez0fXq0PEq7ZtFtlbjL027hVTAdGvGIJEYPxtBQx3MU2fKui4OJW8xNLpMJAuO801lHQoBubUZydeMdUc5PgVXeZS63Njlx8KOnTBnxdPC7dzt2JxeFNAnVrGJCiqWUAlSl7ETk6//staQN/ViXZmbfiLCCeXi6788t6J9iMOXYcL4utC/8+TY4UXO6kLo1XtgnbNyH6S+xOYsFZj3hkg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI3659Sm+BqV5w+u7eJ1S3NSEdTHXQq+SGnvz9oBuxk=;
 b=Rl6KuE9ZccYaP/+9z2cJs97d8vSKgb4aVeeCs+WPvtddjUigoYxCHUnsTNPuIPTH5uWQvxPNH2dYLCGZ/zc0J5cvArmoIVT6lmJxAm4SUN+UHKCil5gelDQ4RWBBKVXl5ZceUHEtVOnCkONC1756mA/OCLrLadqheimcbNOH4uI=
Received: from DM5PR12MB1578.namprd12.prod.outlook.com (2603:10b6:4:e::7) by
 DM5PR12MB1387.namprd12.prod.outlook.com (2603:10b6:3:6c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Tue, 24 Mar 2020 10:31:18 +0000
Received: from DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::50f0:a148:4f52:701f]) by DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::50f0:a148:4f52:701f%11]) with mapi id 15.20.2835.021; Tue, 24 Mar
 2020 10:31:18 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?iso-8859-1?Q?Thomas_Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: Separate pull request? WAS: [PATCH v6 0/9] Huge page-table
 entries for TTM
Thread-Topic: Separate pull request? WAS: [PATCH v6 0/9] Huge page-table
 entries for TTM
Thread-Index: AQHV8g+2hJkFvufeEEqndLeD8JMe96hXosOAgAAH0g0=
Date: Tue, 24 Mar 2020 10:31:18 +0000
Message-ID: <0d04f17d-1c8e-47dc-8191-cc9022f64853@email.android.com>
References: <20200304102840.2801-1-thomas_os@shipmail.org>,
 <23b212f3-d5cf-6315-23af-b084dcbbe958@shipmail.org>
In-Reply-To: <23b212f3-d5cf-6315-23af-b084dcbbe958@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-originating-ip: [2a02:908:1252:fb60:d499:4acd:5ca0:7c60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 62ac97aa-b511-4d5f-3cb8-08d7cfde7d44
x-ms-traffictypediagnostic: DM5PR12MB1387:
x-microsoft-antispam-prvs: <DM5PR12MB13875D69DA1EF1D0D193D65F83F10@DM5PR12MB1387.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:73;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(966005)(66476007)(66574012)(66946007)(76116006)(53546011)(4326008)(91956017)(64756008)(9686003)(2906002)(6512007)(5660300002)(6506007)(66446008)(66556008)(316002)(45080400002)(478600001)(31686004)(31696002)(6486002)(6916009)(8936002)(86362001)(186003)(81156014)(8676002)(81166006)(71200400001)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1387;
 H:DM5PR12MB1578.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oVOBL32ie1hDsp7xs3gQpFsig56YyHZv0tkKzfkV+/nnQ33PVeHkpE8u/abCgdRfR1s4FUReP/EcQBB7CDDIgGL0z3myYHn/NisAOpF7I/AxPF/m1DX+FQYcRdH9aEISLyEg1kPmurIOtKjWQdOQzuq5VMsiMdDPRzyDlLUu/6adQUufcZIBoI+0FkseO17r6yfS2LHtz+3SLz4xFCfqCxORXRY4ZeS2Tp2jW+qBurXvgcGH2yAkdDXGqZuNzQ8VnzGJ7L75w2j8yv5jSZYnkvya1w0UqVcw41GjrCZHEsBvuKd0r8weKOV2pelSLmsLXlF8xq3+AxCcAsMiETxg6mNiikswN/zZa+TBqyLPxTYg3ibPWF6e9VRAg1FJn+Vj8DQFEVYHZLn3z2B/NuAOrFQ/q72MjJRPddayT4L9T8tGkGUF4uSgDIpHHy1CZV6Fe7RWTJZqkMuBhd2rAVkM8ZgNFRprq4DfBh9+5wlCv+56UysBXC2W94/X0ECVVZX7n5q1kZ9gXmQZsnPjNPyE9w==
x-ms-exchange-antispam-messagedata: bxo82boZy3hJkj4cQAGXRlMtFMI5SJoS4czqEAd02ejEr9Rt9/vVUeE3/YYuIdJnBzySWy2lnL+Kv9TDFSp8YTkS4Z+oQ0CUDfTQc2TQROSlS+hlBIuSEn/eUgh6z9U+3Aak1ClZ0mAoVSxfvsuTIX6NX+PhAqa28J520Miu73hNEQi56zwUANx5DmOFYCRPppiSFqLENjYVi4v2a8r4Hw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ac97aa-b511-4d5f-3cb8-08d7cfde7d44
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 10:31:18.5978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qjfd4WXztbrz28OkOpRw5wRkwGkwDu9rmJDWERHJck7bLBm9P7jzAXCVk+WUOLRq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1387
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1404995495=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1404995495==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_0d04f17d1c8e47dc8191cc9022f64853emailandroidcom_"

--_000_0d04f17d1c8e47dc8191cc9022f64853emailandroidcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Yeah, sure go ahead.

It's just that I am out of office because of COVID-19 and won't be able to =
help if it goes up in flames :)

Cheers,
Christian

Am 24.03.2020 11:03 schrieb "Thomas Hellstr=F6m (VMware)" <thomas_os@shipma=
il.org>:


On 3/4/20 11:28 AM, Thomas Hellstr=F6m (VMware) wrote:
> In order to reduce CPU usage [1] and in theory TLB misses this patchset e=
nables
> huge- and giant page-table entries for TTM and TTM-enabled graphics drive=
rs.
>
> Patch 1 and 2 introduce a vma_is_special_huge() function to make the mm c=
ode
> take the same path as DAX when splitting huge- and giant page table entri=
es,
> (which currently means zapping the page-table entry and rely on re-faulti=
ng).
>
> Patch 3 makes the mm code split existing huge page-table entries
> on huge_fault fallbacks. Typically on COW or on buffer-objects that want
> write-notify. COW and write-notification is always done on the lowest
> page-table level. See the patch log message for additional considerations=
.
>
> Patch 4 introduces functions to allow the graphics drivers to manipulate
> the caching- and encryption flags of huge page-table entries without ugly
> hacks.
>
> Patch 5 implements the huge_fault handler in TTM.
> This enables huge page-table entries, provided that the kernel is configu=
red
> to support transhuge pages, either by default or using madvise().
> However, they are unlikely to be inserted unless the kernel buffer object
> pfns and user-space addresses align perfectly. There are various options
> here, but since buffer objects that reside in system pages typically star=
t
> at huge page boundaries if they are backed by huge pages, we try to enfor=
ce
> buffer object starting pfns and user-space addresses to be huge page-size
> aligned if their size exceeds a huge page-size. If pud-size transhuge
> ("giant") pages are enabled by the arch, the same holds for those.
>
> Patch 6 implements a specialized huge_fault handler for vmwgfx.
> The vmwgfx driver may perform dirty-tracking and needs some special code
> to handle that correctly.
>
> Patch 7 implements a drm helper to align user-space addresses according
> to the above scheme, if possible.
>
> Patch 8 implements a TTM range manager for vmwgfx that does the same for
> graphics IO memory. This may later be reused by other graphics drivers
> if necessary.
>
> Patch 9 finally hooks up the helpers of patch 7 and 8 to the vmwgfx drive=
r.
> A similar change is needed for graphics drivers that want a reasonable
> likelyhood of actually using huge page-table entries.
>
> If a buffer object size is not huge-page or giant-page aligned,
> its size will NOT be inflated by this patchset. This means that the buffe=
r
> object tail will use smaller size page-table entries and thus no memory
> overhead occurs. Drivers that want to pay the memory overhead price need =
to
> implement their own scheme to inflate buffer-object sizes.
>
> PMD size huge page-table-entries have been tested with vmwgfx and found t=
o
> work well both with system memory backed and IO memory backed buffer obje=
cts.
>
> PUD size giant page-table-entries have seen limited (fault and COW) testi=
ng
> using a modified kernel (to support 1GB page allocations) and a fake vmwg=
fx
> TTM memory type. The vmwgfx driver does otherwise not support 1GB-size IO
> memory resources.
>
> Comments and suggestions welcome.
> Thomas
>
> Changes since RFC:
> * Check for buffer objects present in contigous IO Memory (Christian K=F6=
nig)
> * Rebased on the vmwgfx emulated coherent memory functionality. That reba=
se
>    adds patch 5.
> Changes since v1:
> * Make the new TTM range manager vmwgfx-specific. (Christian K=F6nig)
> * Minor fixes for configs that don't support or only partially support
>    transhuge pages.
> Changes since v2:
> * Minor coding style and doc fixes in patch 5/9 (Christian K=F6nig)
> * Patch 5/9 doesn't touch mm. Remove from the patch title.
> Changes since v3:
> * Added reviews and acks
> * Implemented ugly but generic ttm_pgprot_is_wrprotecting() instead of ar=
ch
>    specific code.
> Changes since v4:
> * Added timings (Andrew Morton)
> * Updated function documentation (Andrew Morton)
> Changes since v6:
> * Fix drm build error with !CONFIG_MMU
>
> [1]
> The below test program generates the following gnu time output when run o=
n a
> vmwgfx-enabled kernel without the patch series:
>
> 4.78user 6.02system 0:10.91elapsed 99%CPU (0avgtext+0avgdata 1624maxresid=
ent)k
> 0inputs+0outputs (0major+640077minor)pagefaults 0swaps
>
> and with the patch series:
>
> 1.71user 3.60system 0:05.40elapsed 98%CPU (0avgtext+0avgdata 1656maxresid=
ent)k
> 0inputs+0outputs (0major+20079minor)pagefaults 0swaps
>
> A consistent number of reduced graphics page-faults can be seen with norm=
al
> graphics applications, but due to the aggressive buffer object caching in
> vmwgfx user-space drivers the CPU time reduction is within the error marg=
inal.
>
> #include <unistd.h>
> #include <string.h>
> #include <sys/mman.h>
> #include <xf86drm.h>
>
> static void checkerr(int ret, const char *name)
> {
>    if (ret < 0) {
>      perror(name);
>      exit(-1);
>    }
> }
>
> int main(int agc, const char *argv[])
> {
>      struct drm_mode_create_dumb c_arg =3D {0};
>      struct drm_mode_map_dumb m_arg =3D {0};
>      struct drm_mode_destroy_dumb d_arg =3D {0};
>      int ret, i, fd;
>      void *map;
>
>      fd =3D open("/dev/dri/card0", O_RDWR);
>      checkerr(fd, argv[0]);
>
>      for (i =3D 0; i < 10000; ++i) {
>        c_arg.bpp =3D 32;
>        c_arg.width =3D 1024;
>        c_arg.height =3D 1024;
>        ret =3D drmIoctl(fd, DRM_IOCTL_MODE_CREATE_DUMB, &c_arg);
>        checkerr(fd, argv[0]);
>
>        m_arg.handle =3D c_arg.handle;
>        ret =3D drmIoctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &m_arg);
>        checkerr(fd, argv[0]);
>
>        map =3D mmap(NULL, c_arg.size, PROT_READ | PROT_WRITE, MAP_SHARED,=
 fd,
>               m_arg.offset);
>        checkerr(map =3D=3D MAP_FAILED ? -1 : 0, argv[0]);
>
>        (void) madvise((void *) map, c_arg.size, MADV_HUGEPAGE);
>        memset(map, 0x67, c_arg.size);
>        munmap(map, c_arg.size);
>
>        d_arg.handle =3D c_arg.handle;
>        ret =3D drmIoctl(fd, DRM_IOCTL_MODE_DESTROY_DUMB, &d_arg);
>        checkerr(ret, argv[0]);
>      }
>
>      close(fd);
> }
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: "J=E9r=F4me Glisse" <jglisse@redhat.com>
> Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7Cchri=
stian.koenig%40amd.com%7Cbd52811a941244ba8b9908d7cfda99cb%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637206410124474022&amp;sdata=3D642fi4213qtdqtYC=
FfPNesOIDGmoYBuR4PeEzWMyfKE%3D&amp;reserved=3D0

Hi, Christian,

I think this should be OK to merge now. Is it OK if I ask Dave to pull
this separately?

Thanks,

Thomas



--_000_0d04f17d1c8e47dc8191cc9022f64853emailandroidcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto">Yeah, sure go ahead.
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">It's just that I am out of office because of COVID-19 and=
 won't be able to help if it goes up in flames :)</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Cheers,</div>
<div dir=3D"auto">Christian</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">Am 24.03.2020 11:03 schrieb &quot;Thomas Hells=
tr=F6m (VMware)&quot; &lt;thomas_os@shipmail.org&gt;:<br type=3D"attributio=
n">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText"><br>
<br>
On 3/4/20 11:28 AM, Thomas Hellstr=F6m (VMware) wrote:<br>
&gt; In order to reduce CPU usage [1] and in theory TLB misses this patchse=
t enables<br>
&gt; huge- and giant page-table entries for TTM and TTM-enabled graphics dr=
ivers.<br>
&gt;<br>
&gt; Patch 1 and 2 introduce a vma_is_special_huge() function to make the m=
m code<br>
&gt; take the same path as DAX when splitting huge- and giant page table en=
tries,<br>
&gt; (which currently means zapping the page-table entry and rely on re-fau=
lting).<br>
&gt;<br>
&gt; Patch 3 makes the mm code split existing huge page-table entries<br>
&gt; on huge_fault fallbacks. Typically on COW or on buffer-objects that wa=
nt<br>
&gt; write-notify. COW and write-notification is always done on the lowest<=
br>
&gt; page-table level. See the patch log message for additional considerati=
ons.<br>
&gt;<br>
&gt; Patch 4 introduces functions to allow the graphics drivers to manipula=
te<br>
&gt; the caching- and encryption flags of huge page-table entries without u=
gly<br>
&gt; hacks.<br>
&gt;<br>
&gt; Patch 5 implements the huge_fault handler in TTM.<br>
&gt; This enables huge page-table entries, provided that the kernel is conf=
igured<br>
&gt; to support transhuge pages, either by default or using madvise().<br>
&gt; However, they are unlikely to be inserted unless the kernel buffer obj=
ect<br>
&gt; pfns and user-space addresses align perfectly. There are various optio=
ns<br>
&gt; here, but since buffer objects that reside in system pages typically s=
tart<br>
&gt; at huge page boundaries if they are backed by huge pages, we try to en=
force<br>
&gt; buffer object starting pfns and user-space addresses to be huge page-s=
ize<br>
&gt; aligned if their size exceeds a huge page-size. If pud-size transhuge<=
br>
&gt; (&quot;giant&quot;) pages are enabled by the arch, the same holds for =
those.<br>
&gt;<br>
&gt; Patch 6 implements a specialized huge_fault handler for vmwgfx.<br>
&gt; The vmwgfx driver may perform dirty-tracking and needs some special co=
de<br>
&gt; to handle that correctly.<br>
&gt;<br>
&gt; Patch 7 implements a drm helper to align user-space addresses accordin=
g<br>
&gt; to the above scheme, if possible.<br>
&gt;<br>
&gt; Patch 8 implements a TTM range manager for vmwgfx that does the same f=
or<br>
&gt; graphics IO memory. This may later be reused by other graphics drivers=
<br>
&gt; if necessary.<br>
&gt;<br>
&gt; Patch 9 finally hooks up the helpers of patch 7 and 8 to the vmwgfx dr=
iver.<br>
&gt; A similar change is needed for graphics drivers that want a reasonable=
<br>
&gt; likelyhood of actually using huge page-table entries.<br>
&gt;<br>
&gt; If a buffer object size is not huge-page or giant-page aligned,<br>
&gt; its size will NOT be inflated by this patchset. This means that the bu=
ffer<br>
&gt; object tail will use smaller size page-table entries and thus no memor=
y<br>
&gt; overhead occurs. Drivers that want to pay the memory overhead price ne=
ed to<br>
&gt; implement their own scheme to inflate buffer-object sizes.<br>
&gt;<br>
&gt; PMD size huge page-table-entries have been tested with vmwgfx and foun=
d to<br>
&gt; work well both with system memory backed and IO memory backed buffer o=
bjects.<br>
&gt;<br>
&gt; PUD size giant page-table-entries have seen limited (fault and COW) te=
sting<br>
&gt; using a modified kernel (to support 1GB page allocations) and a fake v=
mwgfx<br>
&gt; TTM memory type. The vmwgfx driver does otherwise not support 1GB-size=
 IO<br>
&gt; memory resources.<br>
&gt;<br>
&gt; Comments and suggestions welcome.<br>
&gt; Thomas<br>
&gt;<br>
&gt; Changes since RFC:<br>
&gt; * Check for buffer objects present in contigous IO Memory (Christian K=
=F6nig)<br>
&gt; * Rebased on the vmwgfx emulated coherent memory functionality. That r=
ebase<br>
&gt;&nbsp;&nbsp;&nbsp; adds patch 5.<br>
&gt; Changes since v1:<br>
&gt; * Make the new TTM range manager vmwgfx-specific. (Christian K=F6nig)<=
br>
&gt; * Minor fixes for configs that don't support or only partially support=
<br>
&gt;&nbsp;&nbsp;&nbsp; transhuge pages.<br>
&gt; Changes since v2:<br>
&gt; * Minor coding style and doc fixes in patch 5/9 (Christian K=F6nig)<br=
>
&gt; * Patch 5/9 doesn't touch mm. Remove from the patch title.<br>
&gt; Changes since v3:<br>
&gt; * Added reviews and acks<br>
&gt; * Implemented ugly but generic ttm_pgprot_is_wrprotecting() instead of=
 arch<br>
&gt;&nbsp;&nbsp;&nbsp; specific code.<br>
&gt; Changes since v4:<br>
&gt; * Added timings (Andrew Morton)<br>
&gt; * Updated function documentation (Andrew Morton)<br>
&gt; Changes since v6:<br>
&gt; * Fix drm build error with !CONFIG_MMU<br>
&gt;<br>
&gt; [1]<br>
&gt; The below test program generates the following gnu time output when ru=
n on a<br>
&gt; vmwgfx-enabled kernel without the patch series:<br>
&gt;<br>
&gt; 4.78user 6.02system 0:10.91elapsed 99%CPU (0avgtext&#43;0avgdata 1624m=
axresident)k<br>
&gt; 0inputs&#43;0outputs (0major&#43;640077minor)pagefaults 0swaps<br>
&gt;<br>
&gt; and with the patch series:<br>
&gt;<br>
&gt; 1.71user 3.60system 0:05.40elapsed 98%CPU (0avgtext&#43;0avgdata 1656m=
axresident)k<br>
&gt; 0inputs&#43;0outputs (0major&#43;20079minor)pagefaults 0swaps<br>
&gt;<br>
&gt; A consistent number of reduced graphics page-faults can be seen with n=
ormal<br>
&gt; graphics applications, but due to the aggressive buffer object caching=
 in<br>
&gt; vmwgfx user-space drivers the CPU time reduction is within the error m=
arginal.<br>
&gt;<br>
&gt; #include &lt;unistd.h&gt;<br>
&gt; #include &lt;string.h&gt;<br>
&gt; #include &lt;sys/mman.h&gt;<br>
&gt; #include &lt;xf86drm.h&gt;<br>
&gt;<br>
&gt; static void checkerr(int ret, const char *name)<br>
&gt; {<br>
&gt;&nbsp;&nbsp;&nbsp; if (ret &lt; 0) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perror(name);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(-1);<br>
&gt;&nbsp;&nbsp;&nbsp; }<br>
&gt; }<br>
&gt;<br>
&gt; int main(int agc, const char *argv[])<br>
&gt; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_mode_create_dumb c_arg =3D {0=
};<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_mode_map_dumb m_arg =3D {0};<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_mode_destroy_dumb d_arg =3D {=
0};<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, i, fd;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *map;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(&quot;/dev/dri/card0&quot;, =
O_RDWR);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; checkerr(fd, argv[0]);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; 10000; &#43;&#43;i)=
 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c_arg.bpp =3D 32;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c_arg.width =3D 1024;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c_arg.height =3D 1024;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOC=
TL_MODE_CREATE_DUMB, &amp;c_arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; checkerr(fd, argv[0]);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m_arg.handle =3D c_arg.handl=
e;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOC=
TL_MODE_MAP_DUMB, &amp;m_arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; checkerr(fd, argv[0]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map =3D mmap(NULL, c_arg.siz=
e, PROT_READ | PROT_WRITE, MAP_SHARED, fd,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; m_arg.offset);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; checkerr(map =3D=3D MAP_FAIL=
ED ? -1 : 0, argv[0]);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void) madvise((void *) map,=
 c_arg.size, MADV_HUGEPAGE);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(map, 0x67, c_arg.size=
);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; munmap(map, c_arg.size);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d_arg.handle =3D c_arg.handl=
e;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOC=
TL_MODE_DESTROY_DUMB, &amp;d_arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; checkerr(ret, argv[0]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; }<br>
&gt;<br>
&gt; Cc: Andrew Morton &lt;akpm@linux-foundation.org&gt;<br>
&gt; Cc: Michal Hocko &lt;mhocko@suse.com&gt;<br>
&gt; Cc: &quot;Matthew Wilcox (Oracle)&quot; &lt;willy@infradead.org&gt;<br=
>
&gt; Cc: &quot;Kirill A. Shutemov&quot; &lt;kirill.shutemov@linux.intel.com=
&gt;<br>
&gt; Cc: Ralph Campbell &lt;rcampbell@nvidia.com&gt;<br>
&gt; Cc: &quot;J=E9r=F4me Glisse&quot; &lt;jglisse@redhat.com&gt;<br>
&gt; Cc: &quot;Christian K=F6nig&quot; &lt;christian.koenig@amd.com&gt;<br>
&gt; Cc: Dan Williams &lt;dan.j.williams@intel.com&gt;<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; dri-devel@lists.freedesktop.org<br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;dat=
a=3D02%7C01%7Cchristian.koenig%40amd.com%7Cbd52811a941244ba8b9908d7cfda99cb=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637206410124474022&amp;amp;sd=
ata=3D642fi4213qtdqtYCFfPNesOIDGmoYBuR4PeEzWMyfKE%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=3D02%7C01%7Cch=
ristian.koenig%40amd.com%7Cbd52811a941244ba8b9908d7cfda99cb%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637206410124474022&amp;amp;sdata=3D642fi4213q=
tdqtYCFfPNesOIDGmoYBuR4PeEzWMyfKE%3D&amp;amp;reserved=3D0</a><br>
<br>
Hi, Christian,<br>
<br>
I think this should be OK to merge now. Is it OK if I ask Dave to pull <br>
this separately?<br>
<br>
Thanks,<br>
<br>
Thomas<br>
<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_0d04f17d1c8e47dc8191cc9022f64853emailandroidcom_--

--===============1404995495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1404995495==--
