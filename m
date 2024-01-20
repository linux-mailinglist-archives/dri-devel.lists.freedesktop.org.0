Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329CB8334E8
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 14:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81E710E2AB;
	Sat, 20 Jan 2024 13:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C76310E2A2
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 13:57:27 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-337bad75860so1282590f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 05:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1705758985; x=1706363785; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fKntHsVK7ZHbkUaoI649HM61Lfigewwx7bT//BScNOk=;
 b=OipLZyFlwoM+uosys3OOSeLS7ZSETdvb3L+5iR263CDQ7ioQ+frIsaTD/6V90Y8Yqm
 iiQQYQpkp7cEJ6tYbanc5WBViN5US8i5sG7cfnvSWJjslhD7vsgEjFCiJ7LCyY04/GBj
 r+uu8mwcfPeopWk73s1qdRjR9e7BsJcZF6gZ7yTH6sfJh3xePJ2mcqjgUEzYJ3kyl4UU
 MVmgSzarDo45tNVJmI5aum2kJdb41u5OTGvVUIo641RdOOZseDtMOal6TXYN1PmxKMe4
 7UiiDDThfdW+RQtTirXEtCD50YEUK6M9Y2o2Opio5ZMkrQakKaVrFpMbVNjfCbKSxQjy
 kG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705758985; x=1706363785;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fKntHsVK7ZHbkUaoI649HM61Lfigewwx7bT//BScNOk=;
 b=BzbTEpk1z+mWMUzCsIdl9s1WkAI8vUHDjb/bPSkiP/v4H2dA7SodvlTLff8eLz+zsL
 HS+Ng3TRjGNZBwM/LeP5EtRxMyCq4NUnQaSPADLMCW3d/wGP8W/Is9NamKiZniUWsamz
 Az3cb4mzVM8Z3mDLlC5aLzCc6vJ9/+C340hlTbG3gvuuHwJ/DHQ4hHSV5acpjuGQDTPA
 7vhZkQwcrhqfE3UKjlN5NFXI94JXVCbuPCD1/uTP++0N1IopeB1p9jobioWtoD4ymHh0
 OfK/qyvlqwNgy9A2aL1XcU2APvXSzl5uueIcs5wdJyLOa5DsLo8hH07z3JhH6GkFx0jG
 pXmA==
X-Gm-Message-State: AOJu0YzWnGMfOKCDycqqPjrCdRigEQCuy+TqYu1QKsK8MtDaycI4wHGk
 CmraUtZWXcZgvVjegHTCHzUmkDzmBm/m5BD9Xx2xlm5SaRxZZZvY9JKB21BCtN8=
X-Google-Smtp-Source: AGHT+IEj7Khr+AeIXtgZshZZ0+HGZ7QEb8vBc00JvFOsSB0ucrpwDciCpLnd6oCAK7zDzqiVHOyPkg==
X-Received: by 2002:adf:f6cb:0:b0:337:c55d:a05a with SMTP id
 y11-20020adff6cb000000b00337c55da05amr778271wrp.66.1705758985409; 
 Sat, 20 Jan 2024 05:56:25 -0800 (PST)
Received: from suse.de ([81.95.8.245]) by smtp.gmail.com with ESMTPSA id
 l20-20020a5d5274000000b00337d1c832basm6315844wrc.113.2024.01.20.05.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 05:56:25 -0800 (PST)
Date: Sat, 20 Jan 2024 14:56:23 +0100
From: Stefan Dirsch <sndirsch@suse.com>
To: Jordan Justen <jordan.l.justen@intel.com>
Subject: Re: Mesa >= 23.3.x and python 2.6 ...
Message-ID: <20240120135623.6b3fqhaxdoctuqk3@suse.de>
References: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
 <170569503795.494457.15400783572444467039@jljusten-skl>
 <20240119202424.ronbrs5dts3bn5n6@suse.de>
 <170574407803.494457.2218713541081503202@jljusten-skl>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="iznum2gp4o67v626"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <170574407803.494457.2218713541081503202@jljusten-skl>
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
Cc: mesa-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dylan Baker <dylan@pnwbakers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iznum2gp4o67v626
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Jordan

On Sat, Jan 20, 2024 at 01:47:58AM -0800, Jordan Justen wrote:
> On 2024-01-19 12:24:24, Stefan Dirsch wrote:
> > Hi Jordan
> > 
> > Thanks for digging into this!
> > 
> > On Fri, Jan 19, 2024 at 12:10:37PM -0800, Jordan Justen wrote:
> > > On 2024-01-18 04:37:52, Stefan Dirsch wrote:
> > > > Hi
> > > > 
> > > > I noticed that with version 23.3.x Mesa no longer can be built with python
> > > > 2.6. It still worked with Mesa 23.2.1.
> > > 
> > > As mentioned in other emails, this was typo where 3.6 was intended.
> > > 
> > > > 
> > > > It fails with
> > > > 
> > > > [   95s] Traceback (most recent call last):
> > > > [   95s]   File "../src/intel/genxml/gen_bits_header.py", line 23, in <module>
> > > > [   95s]     import intel_genxml
> > > > [   95s]   File "/home/abuild/rpmbuild/BUILD/mesa-23.3.3/src/intel/genxml/intel_
> > > > genxml.py", line 5
> > > > [   95s]     from __future__ import annotations
> > > > [   95s]     ^
> > > > [   95s] SyntaxError: future feature annotations is not defined
> > > > 
> > > 
> > > I guess this code first appeared in Dylan's:
> > > 
> > > 4fd2e15855d ("intel/genxml: add type annotations to gen_sort_tags.py")
> > > 
> > > and then became part of the standard tests a few commits later in:
> > > 
> > > 1f0a0a46d97 ("meson: run genxml sort tests")
> > > 
> > > back in Oct 2022. So, I guess at that point 'ninja test' would have
> > > failed with Python 3.6.
> > > 
> > > Then, I suppose I propagated this to being used on every build in:
> > > 
> > > 0495f952d48 ("intel/genxml: Add genxml_import.py script")
> > > 
> > > in Sept 2023.
> > 
> > Thanks. This explains why I've found this code already in older releases, but
> > it didn't fail for me yet. You said tests. Is this just a test, I could
> > disable (as dirty hack)? I was assuming it would generate code ...
> 
> In 0495f952d48, I moved in to a common file, and essentially, now it's
> used by our script that runs during the build in addition to the test.
> 
> It was "fun" finding a way to get python 3.6 :), but after that, I
> think I found a way to make Python 3.6 work. I guess you can try it
> out:
> 
> https://gitlab.freedesktop.org/jljusten/mesa/-/commits/intel-genxml-python3.6
> 
> In my light testing, Python 3.6 through 3.13 seemed to work. Python
> 3.5 did *not* work.

Wow! Thanks a lot! Indeed these two patches fix this build issue for me! :-)

In addition I needed to add the attached patch to fix some more errors I saw
with a python 3.6 build. With that I can build again Mesa 23.3.3.

Thanks,
Stefan

Public Key available
------------------------------------------------------
Stefan Dirsch (Res. & Dev.)   SUSE Software Solutions Germany GmbH
Tel: 0911-740 53 0            Frankenstraße 146
FAX: 0911-740 53 479          D-90461 Nürnberg
http://www.suse.de            Germany 
----------------------------------------------------------------
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
(HRB 36809, AG Nürnberg)
----------------------------------------------------------------

--iznum2gp4o67v626
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="python36-buildfix.patch"

--- mesa-23.3.3/src/nouveau/nvidia-headers/class_parser.py.orig	2024-01-20 12:47:36.464476669 +0100
+++ mesa-23.3.3/src/nouveau/nvidia-headers/class_parser.py	2024-01-20 13:04:30.212851443 +0100
@@ -9,6 +9,16 @@
 
 from mako.template import Template
 
+def removeprefix(s, prefix):
+    if s.startswith(prefix):
+        return s[len(prefix):]
+    return s
+
+def removesuffix(s, suffix):
+    if s.endswith(suffix):
+        return s[:-len(suffix)]
+    return s
+
 METHOD_ARRAY_SIZES = {
     'BIND_GROUP_CONSTANT_BUFFER'        : 16,
     'CALL_MME_DATA'                     : 256,
@@ -273,7 +283,7 @@
                 if ":" in list[2]:
                     state = 1
                 elif teststr in list[1]:
-                    curmthd.field_defs[curfield][list[1].removeprefix(teststr)] = list[2]
+                    curmthd.field_defs[curfield][removeprefix(list[1], teststr)] = list[2]
                 else:
                     state = 1
 
@@ -283,7 +293,7 @@
                     if ("0x" in list[2]):
                         state = 1
                     else:
-                        field = list[1].removeprefix(teststr)
+                        field = removeprefix(list[1], teststr)
                         bitfield = list[2].split(":")
                         curmthd.field_name_start[field] = bitfield[1]
                         curmthd.field_name_end[field] = bitfield[0]
@@ -304,13 +314,13 @@
                 is_array = 0
                 if (':' in list[2]):
                     continue
-                name = list[1].removeprefix(teststr)
+                name = removeprefix(list[1], teststr)
                 if name.endswith("(i)"):
                     is_array = 1
-                    name = name.removesuffix("(i)")
+                    name = removesuffix(name, "(i)")
                 if name.endswith("(j)"):
                     is_array = 1
-                    name = name.removesuffix("(j)")
+                    name = removesuffix(name, "(j)")
                 x = method()
                 x.name = name
                 x.addr = list[2]
@@ -336,8 +346,8 @@
 
     clheader = os.path.basename(args.in_h)
     nvcl = clheader
-    nvcl = nvcl.removeprefix("cl")
-    nvcl = nvcl.removesuffix(".h")
+    nvcl = removeprefix(nvcl, "cl")
+    nvcl = removesuffix(nvcl, ".h")
     nvcl = nvcl.upper()
     nvcl = "NV" + nvcl
 
--- mesa-23.3.3/src/freedreno/registers/gen_header.py.orig	2024-01-20 14:01:30.261999839 +0100
+++ mesa-23.3.3/src/freedreno/registers/gen_header.py	2024-01-20 14:01:57.678558692 +0100
@@ -781,7 +781,7 @@ def main():
 	parser.add_argument('--rnn', type=str, required=True)
 	parser.add_argument('--xml', type=str, required=True)
 
-	subparsers = parser.add_subparsers(required=True)
+	subparsers = parser.add_subparsers()
 
 	parser_c_defines = subparsers.add_parser('c-defines')
 	parser_c_defines.set_defaults(func=dump_c_defines)

--iznum2gp4o67v626--
