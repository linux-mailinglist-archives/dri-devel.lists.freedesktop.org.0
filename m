Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB64B5007C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5F310E764;
	Tue,  9 Sep 2025 15:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ujc/zzZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D418A10E764
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 15:01:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LS02030500
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 15:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XqTohBj1qLgWoq9uplvti4/t
 OBT3VUOGqeH3HMHa23Q=; b=Ujc/zzZDfrz66ycCfRDwoKgyozPtCQtDLcQUJy7h
 GpeY6fTqjvPJo3xF2Q1/l9j88dxXLHsirSC1imZ1REETNpdB3FRYkgtckOPoJn6N
 edK04EejMtI64A+tZE5+DHp6PmcgXP7Xeo4/tRtX6dpVuSQx8Tzn1qdBOxO+a1F0
 h3VyMlyqnBljcgisvUlEmP+d90KXSex9RkxWaEsrhNyPBtXhTQwrHFpdiTmyRAhY
 4cTYJIqnsh1P0ZxJwsxztPm10FE4eEPaBdMoYyeXy0n3xoMF1mTQpGdWDZwuBiB2
 08ah60erE2GtkElTqkt2dQ9nAzLNEgBdp3V4b3SrIOGQaA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j8pen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 15:01:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-72e83eb8cafso91347306d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 08:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757430060; x=1758034860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqTohBj1qLgWoq9uplvti4/tOBT3VUOGqeH3HMHa23Q=;
 b=H8bPuk8v43S15sgiGmqTGziiWaqbmOiNg0tnAMmLZ69R9GCosCtdqC0sImyfavWdYV
 jGCG6/w9mvSeBhGSgIa0Uy/KO8Sq4+0i7DdEI5RTUm7ryPX0Mhfs3sX+3v+u7qEfYz/w
 6Uz9nJTxYzEcQx1nm4IkFgK3QXpwC2taPNmvSvQ4t5G0RyzeRvyYQk3Uia/UTKNcYFZC
 GIsRxNEsVDpu6Yqg7OE4EAKReUTJFJM9Vp0anee7vk/3edE5THhzmw8TODEUIFjVH1sx
 P8no1wMZJ08qHrwJHyN856MD+3d9o6JEP/4WUUTmAvCGVydJm4GtdoF84NtkuweQImmO
 O1kA==
X-Gm-Message-State: AOJu0YxIT5jXRXyH7pk5G78gxRLUVDVoJ3/977YBHJ9j8rtIG0Uxphft
 FihUJWIEJGZkkUmJxGrJ9WG9a7nq+Xju9rP0eF7DizdaUTyzG4A/ChHuvHBcqXTazuJDiZrK83P
 H1wsWOpQMZUKRUG1hKXsbIpk3F2pvBwrGjpdMva3tcP6aGK37vLMtCyhxi1gCw5jg5f2hom8=
X-Gm-Gg: ASbGncu3ExQcH7JWfOj8Wlsjec6EO8HdaC1A5PHK/rMQaRi3ZFpE1I72UsuVA+h/w5d
 pZc5MhxDMljHys/Xp+Wt22KG2q8I1Bwkk0jGqKeBEky9szIDypJSqzY9++0ZFHWude+o5UKR7ew
 16JWCBR2ujtnIHRrLLIxw9uYaPBXBXYCzXGNaWMvwQAApn1ql0+JiW6bNTblWj1ItDkt8ve/Ukp
 Mk3o6qpuFMoRLWX+jb4f89x6EVHTtxH8jauelY3WTv66dWyIy/PlqmMJ1kOoyxqvM+fBDkg37NA
 R2P5Se7lkcUQYmRxzQW063jpGdILRNduA4hJP32Bqik4N9HPH+1PJnF0Owm5fIqt8hSdVS2PBP5
 siowOZgxAiPP05+hkdnzDmwGlm1hb7kKdPjH9XPAz9sDfn6XKzBDE
X-Received: by 2002:a05:6214:528f:b0:70e:86:af36 with SMTP id
 6a1803df08f44-73924e25c29mr143249356d6.19.1757430048890; 
 Tue, 09 Sep 2025 08:00:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFtK5sa4xm8mOsPdJfOo7fiBsFLFw85/oBAA2VqPWFp39gtDPu1XOXGBLAKw5O4Aqb0iu2zQ==
X-Received: by 2002:a05:6214:528f:b0:70e:86:af36 with SMTP id
 6a1803df08f44-73924e25c29mr143238896d6.19.1757430041379; 
 Tue, 09 Sep 2025 08:00:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d3662sm39087341fa.69.2025.09.09.08.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 08:00:40 -0700 (PDT)
Date: Tue, 9 Sep 2025 18:00:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
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
Message-ID: <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX5mUoGJSgQV9A
 N1DqeRSEsg6nRjU5n2sMbYk7atFzOIByqcWobDOW5AnHmVsar6Is8IB2dW+f8MyjcQUUNj8WSD2
 VP7zk8ejwAdxwB3ii9FlNmwkrgd0HDm7wKiRWpPa0uh10kWzdYwuzja/QgU1u6Yj0PG/upDvBD7
 me+NLAntj7bAVyhrpGm2VXQVF2582EN4/WjTnQ8C/sTP3/9U5uuw4diIVvzhw+wSHGixdhzl0gl
 rghgvNs91vrFeEEusB40zhqjYjyZfcxx3CIYbLHu3bO8UekzY8bPBxxrkql1x75WWs4Y9NSKUGl
 3ebwCj00TJXwoLMMZcv9yEw9VQFYIF1zWonceiEP7Vki99lASGZiA+cij6MFWjviDK6JtpLbznM
 lik96vuR
X-Proofpoint-ORIG-GUID: BcsLgyORZrpIjX1LX-nCpl3m5iYzfAzM
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c0412c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=q_i8wjiaOVoz8fm2smAA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: BcsLgyORZrpIjX1LX-nCpl3m5iYzfAzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022
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

On Mon, Sep 08, 2025 at 12:30:04PM -0700, Rob Clark wrote:
> Since these generated files are no longer checked in, either in mesa or
> in the linux kernel, simplify things by dropping the verbose generated
> comment.
> 
> These were semi-nerf'd on the kernel side, in the name of build
> reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
> registers: improve reproducibility"), but in a way that was semi-
> kernel specific.  We can just reduce the divergence between kernel
> and mesa by just dropping all of this.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 37 +--------------------
>  1 file changed, 1 insertion(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> index a409404627c7..56273a810c1d 100644
> --- a/drivers/gpu/drm/msm/registers/gen_header.py
> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> @@ -444,9 +444,6 @@ class Parser(object):
>  		self.variants = set()
>  		self.file = []
>  		self.xml_files = []
> -		self.copyright_year = None
> -		self.authors = []
> -		self.license = None
>  
>  	def error(self, message):
>  		parser, filename = self.stack[-1]
> @@ -686,10 +683,6 @@ class Parser(object):
>  			self.parse_field(attrs["name"], attrs)
>  		elif name == "database":
>  			self.do_validate(attrs["xsi:schemaLocation"])
> -		elif name == "copyright":
> -			self.copyright_year = attrs["year"]
> -		elif name == "author":
> -			self.authors.append(attrs["name"] + " <" + attrs["email"] + "> " + attrs["name"])
>  
>  	def end_element(self, name):
>  		if name == "domain":
> @@ -706,8 +699,6 @@ class Parser(object):
>  			self.current_array = self.current_array.parent
>  		elif name == "enum":
>  			self.current_enum = None
> -		elif name == "license":
> -			self.license = self.cdata
>  
>  	def character_data(self, data):
>  		self.cdata += data
> @@ -868,33 +859,7 @@ def dump_c(args, guard, func):
>  
>  	print("#ifndef %s\n#define %s\n" % (guard, guard))
>  
> -	print("""/* Autogenerated file, DO NOT EDIT manually!
> -
> -This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> -http://gitlab.freedesktop.org/mesa/mesa/
> -git clone https://gitlab.freedesktop.org/mesa/mesa.git
> -
> -The rules-ng-ng source files this header was generated from are:
> -""")
> -	maxlen = 0
> -	for filepath in p.xml_files:
> -		new_filepath = re.sub("^.+drivers","drivers",filepath)
> -		maxlen = max(maxlen, len(new_filepath))
> -	for filepath in p.xml_files:
> -		pad = " " * (maxlen - len(new_filepath))
> -		filesize = str(os.path.getsize(filepath))
> -		filesize = " " * (7 - len(filesize)) + filesize
> -		filetime = time.ctime(os.path.getmtime(filepath))
> -		print("- " + new_filepath + pad + " (" + filesize + " bytes, from <stripped>)")
> -	if p.copyright_year:
> -		current_year = str(datetime.date.today().year)
> -		print()
> -		print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
> -		for author in p.authors:
> -			print("- " + author)
> -	if p.license:
> -		print(p.license)

IANAL, but I as the generated files contain C/C++ functions, I think we
need to have a corresponding licence in the file.

> -	print("*/")
> +	print("/* Autogenerated file, DO NOT EDIT manually! */")
>  
>  	print()
>  	print("#ifdef __KERNEL__")
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
