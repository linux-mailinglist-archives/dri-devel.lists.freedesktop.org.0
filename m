Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C330B5213F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 21:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171AE10E9C4;
	Wed, 10 Sep 2025 19:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dM3u2X4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CAB10E9C4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:38:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgDgT020511
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KQu1oB27eIlAjTTYbUEVNBhRjkuYrUPFp5Bg13JvYK0=; b=dM3u2X4JFtWXF7rv
 MxD7iONV/6g1+O2+D9GH62cQBPHvbJszqQ/c/t2uE00YpIAhmqR/QCb4s91xx8Ya
 mJYNvf1V/UqLe/PeOMabk1/plkG9ybw7mXDWXyBzjfGTo+nf4B+PgTOjDZyvj6Vb
 Ug1eGTtrk1Z3uTclAcnepofloqRIpyRqcI5PY5Nclk3rYfsYvzTynvFCxnAmY2dA
 nL8ZiVBwibruBKR4q0YUVFKQr6VBZgMQr8VyQFBOLNymeAV01vmbeFOP+IZFEI3r
 4Ag91Nhde/+nhBEF7FeKOcih6gfybr+D5v2NEZMdkH4xboBJbZb4ehO7s7WmvPBF
 eCuTtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc294xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:38:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b49666c8b8so1353421cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757533127; x=1758137927;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KQu1oB27eIlAjTTYbUEVNBhRjkuYrUPFp5Bg13JvYK0=;
 b=pkut/GiBJVk4oZEagRqW7tiLmGBRm9cGVE/ZHhgAUh6fo+nDMt29btTAl5VZ058R2+
 ol9d3C6iomCbqgRFLJfnF6T1FuLPMBYxnvsyRrUy7exEQXhs3Ulbn2HDgnjMNgLxNnYy
 A+Pu6l1+b/caZHdVoY9NsZHG1Qhf9Xtf58VCPsAmvLEfwL8h+oPHWQ1fCno12RPQLhhY
 Ms71MfcMcpzyYDF9qlaWiJFt2CJc0KXHyVKnURk1dcv3AOdIJnLVH0USIyj8GUL/g7WK
 A0JXGCrlOc0pQIRWX/D3RGue9jJYH1wUgj++5kHbqkmiHreqFLMu+eVqgDaxddQQvrTG
 06Jg==
X-Gm-Message-State: AOJu0Yzrox3I7SBLA3tABYPwHxwB7GyqfkDaITG8cn5sx99xYxEo8Wpc
 pUd64PW3PAYhLSOfU4836MkdvXVdQOmqXYMhC6SsY1oOZmVcXYJPWrPmz9uvQg9HJa15TnhwlV/
 k5I6o7tDzqksxyenEP12P3PM2EUsBUHOAXkAdBhVkNUFbPHCJNUh2CG0Cb1g8qyvUsmzm+3w=
X-Gm-Gg: ASbGncv+/gja319vEn22R0Nb9H1O84kKgM5nD4w1mOtwemiX0ToQm9j2ET1Rx6nw0oX
 ZViIiXpGsA4SWC9BfRIfw4UEIqpPDmuUYLsXPvpOmLPCnHh8JG0hdJ0N1SV+FiU4mLfIhQMEBjz
 jYDdv9tRCf1yi3SEXTODUhfDeEHyADZ+kZ47o9U6tEWiR9UboefI7S2eHg00V8li2ZDObbAfq4s
 e54bLI0uzBUNPSqFnsgLktgNvn0ilXSsJxF3R3Ip4/N11edeEZrKWLHQVWCv2ylYyvEPi2qKBwL
 S7EWsypLmFdxRiu/tCCDt+CohxTYjY6O1TjiCA7G3u1cTzqfQnzcwbrnqnT0PcJXdsM+NsNxY4t
 mVK0PgojJOcU69mm09v8VBMDDrt9Hpzldy+V/uBohK3Mi7zTTn9EB
X-Received: by 2002:a05:622a:1115:b0:4b3:a2f6:d5e7 with SMTP id
 d75a77b69052e-4b5f846aecfmr191472371cf.60.1757533126887; 
 Wed, 10 Sep 2025 12:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWpzldX+nVaSSGFt/xXRLMND2ntg53y340LE916xuyEMHMVjbyw6ovDoruvOslzFHp0wFBkQ==
X-Received: by 2002:a05:622a:1115:b0:4b3:a2f6:d5e7 with SMTP id
 d75a77b69052e-4b5f846aecfmr191471741cf.60.1757533126191; 
 Wed, 10 Sep 2025 12:38:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56db89110c4sm53690e87.5.2025.09.10.12.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 12:38:45 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:38:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] drm/msm/registers: Remove license/etc from generated
 headers
Message-ID: <sydyej7hrw6tryx5lnidqucx3bcw34dkinj5c2u6szbv2wgnuo@utrlq5q5pt6n>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
 <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
 <CACSVV02Zym2hC-fFcJsP4M9T4mYGXsMtGrmnux6Eva0C7PHdfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02Zym2hC-fFcJsP4M9T4mYGXsMtGrmnux6Eva0C7PHdfA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c1d3c7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=UhSop3MGIIBhUl3aXewA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: If9WR3G_1f3m-PG4XtvsLYYDlu08LAZK
X-Proofpoint-GUID: If9WR3G_1f3m-PG4XtvsLYYDlu08LAZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfXxRuDqQLZLIO8
 /8C2Ks8COgdIDm1QA3E7tPTf7xYMNop23hskLWsNiIfkkHLu1qUNDDlx0b1fF34siDe7BQrZYld
 KBf5QHAASXeQN9GUlf6BaX5Zz5GTisMm49wsU7GoZuO9OJtRMdEinJbV5UbBe65YxfJWNU7mQuZ
 /xjnfTNOr2jj1cebTN8aeqkKCqGzhB/RMCQEsf/IFs1LZ3tAKFAhaf4jUM3A0DJ97EP6kl9QKit
 BvUXiwmk3bN72qOv9jTwWsgWJtqeNkA5LOKyBN6LetuoWlI4I4PGIx/EdSKqJK6WDhANyS2xe96
 V5Op3v6Ce2V7FVq3Z83P7hsmJBKmAx0IPegn18U+AMiDwQbgDJjJiPe/7Q5ZRbY/BGSrY9/jezn
 OcHOMneF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

On Tue, Sep 09, 2025 at 10:25:52AM -0700, Rob Clark wrote:
> On Tue, Sep 9, 2025 at 8:01 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Sep 08, 2025 at 12:30:04PM -0700, Rob Clark wrote:
> > > Since these generated files are no longer checked in, either in mesa or
> > > in the linux kernel, simplify things by dropping the verbose generated
> > > comment.
> > >
> > > These were semi-nerf'd on the kernel side, in the name of build
> > > reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
> > > registers: improve reproducibility"), but in a way that was semi-
> > > kernel specific.  We can just reduce the divergence between kernel
> > > and mesa by just dropping all of this.
> > >
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/registers/gen_header.py | 37 +--------------------
> > >  1 file changed, 1 insertion(+), 36 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> > > index a409404627c7..56273a810c1d 100644
> > > --- a/drivers/gpu/drm/msm/registers/gen_header.py
> > > +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> > > @@ -444,9 +444,6 @@ class Parser(object):
> > >               self.variants = set()
> > >               self.file = []
> > >               self.xml_files = []
> > > -             self.copyright_year = None
> > > -             self.authors = []
> > > -             self.license = None
> > >
> > >       def error(self, message):
> > >               parser, filename = self.stack[-1]
> > > @@ -686,10 +683,6 @@ class Parser(object):
> > >                       self.parse_field(attrs["name"], attrs)
> > >               elif name == "database":
> > >                       self.do_validate(attrs["xsi:schemaLocation"])
> > > -             elif name == "copyright":
> > > -                     self.copyright_year = attrs["year"]
> > > -             elif name == "author":
> > > -                     self.authors.append(attrs["name"] + " <" + attrs["email"] + "> " + attrs["name"])
> > >
> > >       def end_element(self, name):
> > >               if name == "domain":
> > > @@ -706,8 +699,6 @@ class Parser(object):
> > >                       self.current_array = self.current_array.parent
> > >               elif name == "enum":
> > >                       self.current_enum = None
> > > -             elif name == "license":
> > > -                     self.license = self.cdata
> > >
> > >       def character_data(self, data):
> > >               self.cdata += data
> > > @@ -868,33 +859,7 @@ def dump_c(args, guard, func):
> > >
> > >       print("#ifndef %s\n#define %s\n" % (guard, guard))
> > >
> > > -     print("""/* Autogenerated file, DO NOT EDIT manually!
> > > -
> > > -This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> > > -http://gitlab.freedesktop.org/mesa/mesa/
> > > -git clone https://gitlab.freedesktop.org/mesa/mesa.git
> > > -
> > > -The rules-ng-ng source files this header was generated from are:
> > > -""")
> > > -     maxlen = 0
> > > -     for filepath in p.xml_files:
> > > -             new_filepath = re.sub("^.+drivers","drivers",filepath)
> > > -             maxlen = max(maxlen, len(new_filepath))
> > > -     for filepath in p.xml_files:
> > > -             pad = " " * (maxlen - len(new_filepath))
> > > -             filesize = str(os.path.getsize(filepath))
> > > -             filesize = " " * (7 - len(filesize)) + filesize
> > > -             filetime = time.ctime(os.path.getmtime(filepath))
> > > -             print("- " + new_filepath + pad + " (" + filesize + " bytes, from <stripped>)")
> > > -     if p.copyright_year:
> > > -             current_year = str(datetime.date.today().year)
> > > -             print()
> > > -             print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
> > > -             for author in p.authors:
> > > -                     print("- " + author)
> > > -     if p.license:
> > > -             print(p.license)
> >
> > IANAL, but I as the generated files contain C/C++ functions, I think we
> > need to have a corresponding licence in the file.
> 
> I can't find anything that indicates a difference depending on the
> contents of the generated file (ie. whether it be
> functions/tables/prototypes/etc).  And AFAICT it is implicit that the
> license of the generated file is inherited from the input to the
> generator.
> 
> Some other points:
> - the various *.mod.c files generated for each kernel module do not
> contain a license
> - various files generated by asn1_compiler do not contain a license
> - other generated .c/.h files are a mixed bag, some contain a license
> header and some do not
> 
> (In all of the cases the generated files should not be distributed,
> IMHO.  Yocto should fix this.)

It's a bit funny. Normally you use something like linux-headers-foo,
which contains just include/*, arch/foo/include/ and some other files.
Yocto has adopted a way of building the modules against a full-kernel
source & binaries dirs. As such, those two directories are parts of the
cache aka 'shared state', which gets shared, etc.

> 
> BR,
> -R
> 
> >
> > > -     print("*/")
> > > +     print("/* Autogenerated file, DO NOT EDIT manually! */")
> > >
> > >       print()
> > >       print("#ifdef __KERNEL__")
> > > --
> > > 2.51.0
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
