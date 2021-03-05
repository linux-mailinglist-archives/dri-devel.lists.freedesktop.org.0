Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E3932F697
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 00:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CDA6E439;
	Fri,  5 Mar 2021 23:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82B46E439
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 23:27:44 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id g4so2374949pgj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 15:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ypm5j1+y2Mq6pdnYf/uA6AI5PjNpTl+eW38sVspOFR4=;
 b=l4krfnI1UVWGTm+V6XN3C3bqRR3U+9MKJhe3xHS1Zg8Ae/1WdehhdEMuQPwwD3tuLJ
 xePLyvpF+fg34J3yvdFIkY93QTMrrKCtIwUnzU87gi20maCHLVnO9P0ShtOPx+4zXVKV
 LlDNyyFEJ4SH01vW+CiGZ55afJOjXVvkZSJdkfTMa6AUZU1mXbgyZO/LNjRUOB2kPRJf
 BVOrmrHIlK4drQPsM7Os+g1DXDH8nK1VX1HjqoNloS9+RFiZBLQKJznG5x+98z8w7ebt
 2Z/Fjnj0qpA1eG6OuQu7shRHlHy8syKsSOt/RaYatq0Uc9ZRPxnvUJX6X1Glhyeuc7An
 ovMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ypm5j1+y2Mq6pdnYf/uA6AI5PjNpTl+eW38sVspOFR4=;
 b=JqN5AXI8qoEOwtYVjvZYpyI1XGWYeR4dNZVHtGs6QQRuW/ljZLkSe/2ToW0AFh3zBB
 LgTrUC06jOTIUGCvVS+WieKc8iGTi6eFwyWfH1+gnwWPrPQ4KUjjGvnzoi3LlW2ZuLQY
 7T4JdfYBMrKK6LwrfgHTtfeTKVu3nnGC585NDizglHjS+OxbSmOBjVlk3LVNTy9vty3T
 79mO/FtykLCqfgBMUfRPGykCk0hhgClsK5bSu0P7yB2KaPoYqNSqZd25Y0Lapc/SdBQ8
 W/2Jrd+brmmCkazkc4GsoYf1WtN/sAeSS4As2p3dvqjc9mGnqo6cO35l1GCnmJ0/lKL2
 5n/w==
X-Gm-Message-State: AOAM533O5sJhdlFJMBa64+p9cBQIpiHM/aR3WC3+wl3+OvFJBVLXRj2+
 2heJFE4kQJJi03bGqE/kEZDjkGZsyzhotxcLq9i2q7RB
X-Google-Smtp-Source: ABdhPJy2pm4qkX1zEZT4/Bytci1CZwjs6hB+RK8UKkb/v49a4D79n4tuCMMegvCJlQuL2Qf8LnInALJu2/wnA1y1Mkw=
X-Received: by 2002:a62:e502:0:b029:1e4:d7c3:5c59 with SMTP id
 n2-20020a62e5020000b02901e4d7c35c59mr11015885pff.51.1614986864198; Fri, 05
 Mar 2021 15:27:44 -0800 (PST)
MIME-Version: 1.0
References: <f9700ce86b6d893a162c099fb680cc0f@nuetzel-hh.de>
In-Reply-To: <f9700ce86b6d893a162c099fb680cc0f@nuetzel-hh.de>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 5 Mar 2021 18:27:08 -0500
Message-ID: <CAAxE2A7SL=Vj+gUqnGQAJZG4VNSz2BphjSsufgwFQe+Tjb4=og@mail.gmail.com>
Subject: Re: Is LLVM 13 (git) really ready for testing/development? libclc
 didn't compile
To: =?UTF-8?Q?Dieter_N=C3=BCtzel?= <Dieter@nuetzel-hh.de>
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
Cc: Karol Herbst <kherbst@redhat.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0020371933=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0020371933==
Content-Type: multipart/alternative; boundary="0000000000005b8b3305bcd26e2c"

--0000000000005b8b3305bcd26e2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I can't answer this because our Mesa team doesn't work on LLVM and we don't
build libclc.

Marek

On Thu, Mar 4, 2021 at 10:20 PM Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> w=
rote:

> Hello Marek,
>
> can't compile anything, here.
> Poor Intel Nehalem X3470.
>
> Trying LLVM 12-rc2 later.
>
> Greetings,
> Dieter
>
> llvm-project/libclc> cd build && cmake ../
> -- The CXX compiler identification is GNU 10.2.1
> -- Detecting CXX compiler ABI info
> -- Detecting CXX compiler ABI info - done
> -- Check for working CXX compiler: /usr/bin/c++ - skipped
> -- Detecting CXX compile features
> -- Detecting CXX compile features - done
> LLVM version: 13.0.0git
> LLVM system libs:
> LLVM libs: -lLLVM-13git
> LLVM libdir: /usr/local/lib
> LLVM bindir: /usr/local/bin
> LLVM ld flags: -L/usr/local/lib
> LLVM cxx flags:
>
> -I/usr/local/include;-std=3Dc++14;;;-fno-exceptions;-D_GNU_SOURCE;-D__STD=
C_CONSTANT_MACROS;-D__STDC_FORMAT_MACROS;-D__STDC_LIMIT_MACROS;-fno-rtti;-f=
no-exceptions
>
> clang: /usr/local/bin/clang
> llvm-as: /usr/local/bin/llvm-as
> llvm-link: /usr/local/bin/llvm-link
> opt: /usr/local/bin/opt
> llvm-spirv: /usr/local/bin/llvm-spirv
>
> -- Check for working CLC compiler: /usr/local/bin/clang
> -- Check for working CLC compiler: /usr/local/bin/clang -- works
> -- Check for working LLAsm compiler: /usr/local/bin/llvm-as
> -- Check for working LLAsm compiler: /usr/local/bin/llvm-as -- broken
> CMake Error at cmake/CMakeTestLLAsmCompiler.cmake:40 (message):
>    The LLAsm compiler "/usr/local/bin/llvm-as" is not able to compile a
> simple
>    test program.
>
>    It fails with the following output:
>
>     Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp
>
>
>
>    Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast && /usr/bin/gmake
> -f
>    CMakeFiles/cmTC_87af9.dir/build.make CMakeFiles/cmTC_87af9.dir/build
>
>    gmake[1]: Verzeichnis
>    =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C w=
ird betreten
>
>    Building LLAsm object CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
>
>    /usr/local/bin/clang -E -P -x cl
>
> /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.ll
> -o
>    CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
>
>    /usr/local/bin/llvm-as -o
> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
>    CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
>
>    /usr/local/bin/llvm-as:
>    CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error:
> expected
>    top-level entity
>
>    typedef unsigned char uchar;
>
>    ^
>
>    gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86:
>    CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1
>
>    gmake[1]: Verzeichnis
>    =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C w=
ird verlassen
>
>    gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2
>
>
>
>
>
>
>
>    CMake will not be able to correctly generate this project.
> Call Stack (most recent call first):
>    CMakeLists.txt:127 (enable_language)
>
>
> -- Configuring incomplete, errors occurred!
> See also "/opt/llvm-project/libclc/build/CMakeFiles/CMakeOutput.log".
> See also "/opt/llvm-project/libclc/build/CMakeFiles/CMakeError.log".
>
>
> CMakeError.log
> Determining if the LLAsm compiler works failed with the following
> output:
> Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp
>
> Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast && /usr/bin/gmake
> -f CMakeFiles/cmTC_87af9.dir/build.make CMakeFiles/cmTC_87af9.dir/build
> gmake[1]: Verzeichnis
> =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C wird=
 betreten
> Building LLAsm object CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
> /usr/local/bin/clang -E -P     -x cl
> /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.ll
> -o CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
> /usr/local/bin/llvm-as -o CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
> /usr/local/bin/llvm-as:
> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error: expected
> top-level entity
> typedef unsigned char uchar;
> ^
> gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86:
> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1
> gmake[1]: Verzeichnis
> =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C wird=
 verlassen
> gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2
>

--0000000000005b8b3305bcd26e2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I can&#39;t answer this =
because our Mesa team doesn&#39;t work on LLVM and we don&#39;t build libcl=
c.</div><div><br></div><div>Marek<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 4, 2021 at 10:20 PM =
Dieter N=C3=BCtzel &lt;<a href=3D"mailto:Dieter@nuetzel-hh.de">Dieter@nuetz=
el-hh.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hello Marek,<br>
<br>
can&#39;t compile anything, here.<br>
Poor Intel Nehalem X3470.<br>
<br>
Trying LLVM 12-rc2 later.<br>
<br>
Greetings,<br>
Dieter<br>
<br>
llvm-project/libclc&gt; cd build &amp;&amp; cmake ../<br>
-- The CXX compiler identification is GNU 10.2.1<br>
-- Detecting CXX compiler ABI info<br>
-- Detecting CXX compiler ABI info - done<br>
-- Check for working CXX compiler: /usr/bin/c++ - skipped<br>
-- Detecting CXX compile features<br>
-- Detecting CXX compile features - done<br>
LLVM version: 13.0.0git<br>
LLVM system libs:<br>
LLVM libs: -lLLVM-13git<br>
LLVM libdir: /usr/local/lib<br>
LLVM bindir: /usr/local/bin<br>
LLVM ld flags: -L/usr/local/lib<br>
LLVM cxx flags: <br>
-I/usr/local/include;-std=3Dc++14;;;-fno-exceptions;-D_GNU_SOURCE;-D__STDC_=
CONSTANT_MACROS;-D__STDC_FORMAT_MACROS;-D__STDC_LIMIT_MACROS;-fno-rtti;-fno=
-exceptions<br>
<br>
clang: /usr/local/bin/clang<br>
llvm-as: /usr/local/bin/llvm-as<br>
llvm-link: /usr/local/bin/llvm-link<br>
opt: /usr/local/bin/opt<br>
llvm-spirv: /usr/local/bin/llvm-spirv<br>
<br>
-- Check for working CLC compiler: /usr/local/bin/clang<br>
-- Check for working CLC compiler: /usr/local/bin/clang -- works<br>
-- Check for working LLAsm compiler: /usr/local/bin/llvm-as<br>
-- Check for working LLAsm compiler: /usr/local/bin/llvm-as -- broken<br>
CMake Error at cmake/CMakeTestLLAsmCompiler.cmake:40 (message):<br>
=C2=A0 =C2=A0The LLAsm compiler &quot;/usr/local/bin/llvm-as&quot; is not a=
ble to compile a <br>
simple<br>
=C2=A0 =C2=A0test program.<br>
<br>
=C2=A0 =C2=A0It fails with the following output:<br>
<br>
=C2=A0 =C2=A0 Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTm=
p<br>
<br>
<br>
<br>
=C2=A0 =C2=A0Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast &amp;&amp;=
 /usr/bin/gmake <br>
-f<br>
=C2=A0 =C2=A0CMakeFiles/cmTC_87af9.dir/build.make CMakeFiles/cmTC_87af9.dir=
/build<br>
<br>
=C2=A0 =C2=A0gmake[1]: Verzeichnis<br>
=C2=A0 =C2=A0=E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=
=80=9C wird betreten<br>
<br>
=C2=A0 =C2=A0Building LLAsm object CMakeFiles/cmTC_87af9.dir/testLLAsmCompi=
ler.bc<br>
<br>
=C2=A0 =C2=A0/usr/local/bin/clang -E -P -x cl<br>
<br>
/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.ll <br=
>
-o<br>
=C2=A0 =C2=A0CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp<br>
<br>
=C2=A0 =C2=A0/usr/local/bin/llvm-as -o <br>
CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc<br>
=C2=A0 =C2=A0CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp<br>
<br>
=C2=A0 =C2=A0/usr/local/bin/llvm-as:<br>
=C2=A0 =C2=A0CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error=
: <br>
expected<br>
=C2=A0 =C2=A0top-level entity<br>
<br>
=C2=A0 =C2=A0typedef unsigned char uchar;<br>
<br>
=C2=A0 =C2=A0^<br>
<br>
=C2=A0 =C2=A0gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86:<br>
=C2=A0 =C2=A0CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1<br>
<br>
=C2=A0 =C2=A0gmake[1]: Verzeichnis<br>
=C2=A0 =C2=A0=E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=
=80=9C wird verlassen<br>
<br>
=C2=A0 =C2=A0gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
=C2=A0 =C2=A0CMake will not be able to correctly generate this project.<br>
Call Stack (most recent call first):<br>
=C2=A0 =C2=A0CMakeLists.txt:127 (enable_language)<br>
<br>
<br>
-- Configuring incomplete, errors occurred!<br>
See also &quot;/opt/llvm-project/libclc/build/CMakeFiles/CMakeOutput.log&qu=
ot;.<br>
See also &quot;/opt/llvm-project/libclc/build/CMakeFiles/CMakeError.log&quo=
t;.<br>
<br>
<br>
CMakeError.log<br>
Determining if the LLAsm compiler works failed with the following <br>
output:<br>
Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp<br>
<br>
Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast &amp;&amp; /usr/bin/gma=
ke=C2=A0 <br>
-f CMakeFiles/cmTC_87af9.dir/build.make CMakeFiles/cmTC_87af9.dir/build<br>
gmake[1]: Verzeichnis <br>
=E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C wird b=
etreten<br>
Building LLAsm object CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc<br>
/usr/local/bin/clang -E -P=C2=A0 =C2=A0 =C2=A0-x cl <br>
/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.ll <br=
>
-o CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp<br>
/usr/local/bin/llvm-as -o CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc <b=
r>
CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp<br>
/usr/local/bin/llvm-as: <br>
CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error: expected <b=
r>
top-level entity<br>
typedef unsigned char uchar;<br>
^<br>
gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86: <br>
CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1<br>
gmake[1]: Verzeichnis <br>
=E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C wird v=
erlassen<br>
gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2<br>
</blockquote></div>

--0000000000005b8b3305bcd26e2c--

--===============0020371933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0020371933==--
