Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75984B50464
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 19:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519E810E275;
	Tue,  9 Sep 2025 17:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGRZdjwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5EB10E22D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 17:26:05 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HMY61009820
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 17:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=dI/tFVPWYxe3gtmKF2QC5qw2SP3z6Sb2TYW/w+Ytjms=; b=gG
 RZdjwxnWNCA5VDqdfrskH+jGqlzP6dMUz5fY1zsBAKKt+50fLGGNIChDbmTspua/
 HGOkRlkbsdfdFVH8vAkQbO3VZ1oCOCWUUMwvoS9RC6gpxnpoigwSHi24Uta70GfV
 4i4FH1aDbSfea/mmmriK/Ex+TVHYr+cEO8+Zo01X67cJh9mKKyfgQrY09S3G4DHV
 s+9hMwnPnisVBtAb/4k2xktb8iGw831cfA8I9SCTl2jGFbcZnDoEOWTqdl9d68Z/
 sNfq2SY5L3wDjUcVOTd2J8UT9QK8TnuFw2ZlZwvXLKNlC2mY6U2NzsbaDCEXq/Gj
 lju1Evql542lEw1s06Gw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdwwj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 17:26:05 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-6219458790dso2317079eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 10:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757438764; x=1758043564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dI/tFVPWYxe3gtmKF2QC5qw2SP3z6Sb2TYW/w+Ytjms=;
 b=cXBfIuM9N42PXHnoShcuSy3bUsIHhgrAzNpae9ILVHho8AYPmdvtpxstMaI/1QqVf/
 UCk8IvvK3zD4PSuu8Nsa2yofUxfqsXwx4JoO0nQ5fujTgUrZBM0NirTffO41wu7A/GNE
 1TMon5fFT55c35yr47oeKdhryWzwH9MusuHLS5U0DDpjEASlMh813cnkEuvZmpOx1GuG
 KBTiqk7cltE3UTGooEhWI160MWs3q6vU1Aro3vMoy281vTH6mEQTDppWwbPDJnckN+lU
 FB/sSGgsdy8yFlmqvW+kMKrDzRXgpN7Mi2uENaf7KgEgsfYw4CgVKEKPg8dSZ0ZVwhtG
 ks7g==
X-Gm-Message-State: AOJu0Yz6eJEI6A4jNtbLdGMdJGVdCEKvtx/qZLe2CiNZw4/gaPoHIqdO
 ojFdonZ/aJN/T39jXti62ZrUZyR096OpIvPFTCr+0VKE8Iz7XVBopkJi5qybwZ8jGGFAEE19dPP
 X6APX2fGe873uGIP2zxWBFfc1bcSFZUO0kebA1sp2hMpQH5fUNIoooJMEUTvSJ4WbweaRuxclVo
 m2dZbzqr+lHd9utcvIfjHBToNEq8nWa+1ic6STXtYxkWADyw==
X-Gm-Gg: ASbGncv4HgBqFM1irFgAjyxNNDKBuE529bszmJj2iGp+3GBrByjoKjGP5rHxdJ+9dIC
 ai8I80410nawF7eXNwlI7h9J1AQv4tKj1DeDgKWNhL4W3WnPb9m5GYqEU+vIPnHdp8qLm1Rsr2r
 GiOhnQKxv0jrVg5Pq8OM3gSnqUgd3ljWM/swGpjRNPMQu9Tv1q0Jzs
X-Received: by 2002:a05:6871:7827:b0:315:60a6:c27b with SMTP id
 586e51a60fabf-3226533837cmr6671378fac.10.1757438764215; 
 Tue, 09 Sep 2025 10:26:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn4AlsT86NdKgN9yHhRkxhjC25mI5BT+6nw4b3oMpLzg3EwapWIo1tkqNKsOWdNothIW6wabluGL0au0IHDWk=
X-Received: by 2002:a05:6871:7827:b0:315:60a6:c27b with SMTP id
 586e51a60fabf-3226533837cmr6671367fac.10.1757438763757; Tue, 09 Sep 2025
 10:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
 <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
In-Reply-To: <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 10:25:52 -0700
X-Gm-Features: Ac12FXxGRIubVyoobxwaPjC26ZhWg4pW-b_VwL3AjiQCcFrkrFqBbJ9eqYgvU-w
Message-ID: <CACSVV02Zym2hC-fFcJsP4M9T4mYGXsMtGrmnux6Eva0C7PHdfA@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/registers: Remove license/etc from generated
 headers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: DLd0CqifLHq7xygp_rRDWQfO_jhlGiXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX5jHJjPtFtuzj
 RLrsG95wMNHjMdHqlI0tzau5O4K7Fx1xB0Yy4nZjYDEi3eMb6kckFW+VwCc87L7Jn6Liod4+Fcb
 smXVDEpdkiPkK5p60Ch/fzPtBYFc0O9zOJePTqCRjL7//bCswLIAYb9hI3YotG9l7Jv/VyDKQgo
 gGdTiBudS7uS64HOkWAGU6kPld9TMPqkczIWn3GOnl8jZFIYaD75ERCnHrhiQ0WddCCY+FJ3RWA
 ijAnsn1VrvC9VLsQPWMbtKMj5Qa71z0uqBR/UJMu/CES30nELGdjflMXQpjqaVBRL13Me8olWFk
 6QGVAb5PCrFDiLmiBHnhaNDfn9lycJsUDbVdQm9JiNgqCJsZ5vA9OJ3H7dG0AcqX7fztyacHGNh
 oLHVqupm
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c0632d cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=w4XaYH8Cdj-KDOQYXpsA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: DLd0CqifLHq7xygp_rRDWQfO_jhlGiXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 9, 2025 at 8:01=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Sep 08, 2025 at 12:30:04PM -0700, Rob Clark wrote:
> > Since these generated files are no longer checked in, either in mesa or
> > in the linux kernel, simplify things by dropping the verbose generated
> > comment.
> >
> > These were semi-nerf'd on the kernel side, in the name of build
> > reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
> > registers: improve reproducibility"), but in a way that was semi-
> > kernel specific.  We can just reduce the divergence between kernel
> > and mesa by just dropping all of this.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/registers/gen_header.py | 37 +--------------------
> >  1 file changed, 1 insertion(+), 36 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/=
drm/msm/registers/gen_header.py
> > index a409404627c7..56273a810c1d 100644
> > --- a/drivers/gpu/drm/msm/registers/gen_header.py
> > +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> > @@ -444,9 +444,6 @@ class Parser(object):
> >               self.variants =3D set()
> >               self.file =3D []
> >               self.xml_files =3D []
> > -             self.copyright_year =3D None
> > -             self.authors =3D []
> > -             self.license =3D None
> >
> >       def error(self, message):
> >               parser, filename =3D self.stack[-1]
> > @@ -686,10 +683,6 @@ class Parser(object):
> >                       self.parse_field(attrs["name"], attrs)
> >               elif name =3D=3D "database":
> >                       self.do_validate(attrs["xsi:schemaLocation"])
> > -             elif name =3D=3D "copyright":
> > -                     self.copyright_year =3D attrs["year"]
> > -             elif name =3D=3D "author":
> > -                     self.authors.append(attrs["name"] + " <" + attrs[=
"email"] + "> " + attrs["name"])
> >
> >       def end_element(self, name):
> >               if name =3D=3D "domain":
> > @@ -706,8 +699,6 @@ class Parser(object):
> >                       self.current_array =3D self.current_array.parent
> >               elif name =3D=3D "enum":
> >                       self.current_enum =3D None
> > -             elif name =3D=3D "license":
> > -                     self.license =3D self.cdata
> >
> >       def character_data(self, data):
> >               self.cdata +=3D data
> > @@ -868,33 +859,7 @@ def dump_c(args, guard, func):
> >
> >       print("#ifndef %s\n#define %s\n" % (guard, guard))
> >
> > -     print("""/* Autogenerated file, DO NOT EDIT manually!
> > -
> > -This file was generated by the rules-ng-ng gen_header.py tool in this =
git repository:
> > -http://gitlab.freedesktop.org/mesa/mesa/
> > -git clone https://gitlab.freedesktop.org/mesa/mesa.git
> > -
> > -The rules-ng-ng source files this header was generated from are:
> > -""")
> > -     maxlen =3D 0
> > -     for filepath in p.xml_files:
> > -             new_filepath =3D re.sub("^.+drivers","drivers",filepath)
> > -             maxlen =3D max(maxlen, len(new_filepath))
> > -     for filepath in p.xml_files:
> > -             pad =3D " " * (maxlen - len(new_filepath))
> > -             filesize =3D str(os.path.getsize(filepath))
> > -             filesize =3D " " * (7 - len(filesize)) + filesize
> > -             filetime =3D time.ctime(os.path.getmtime(filepath))
> > -             print("- " + new_filepath + pad + " (" + filesize + " byt=
es, from <stripped>)")
> > -     if p.copyright_year:
> > -             current_year =3D str(datetime.date.today().year)
> > -             print()
> > -             print("Copyright (C) %s-%s by the following authors:" % (=
p.copyright_year, current_year))
> > -             for author in p.authors:
> > -                     print("- " + author)
> > -     if p.license:
> > -             print(p.license)
>
> IANAL, but I as the generated files contain C/C++ functions, I think we
> need to have a corresponding licence in the file.

I can't find anything that indicates a difference depending on the
contents of the generated file (ie. whether it be
functions/tables/prototypes/etc).  And AFAICT it is implicit that the
license of the generated file is inherited from the input to the
generator.

Some other points:
- the various *.mod.c files generated for each kernel module do not
contain a license
- various files generated by asn1_compiler do not contain a license
- other generated .c/.h files are a mixed bag, some contain a license
header and some do not

(In all of the cases the generated files should not be distributed,
IMHO.  Yocto should fix this.)

BR,
-R

>
> > -     print("*/")
> > +     print("/* Autogenerated file, DO NOT EDIT manually! */")
> >
> >       print()
> >       print("#ifdef __KERNEL__")
> > --
> > 2.51.0
> >
>
> --
> With best wishes
> Dmitry
