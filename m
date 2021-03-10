Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3023335C1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 07:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32CD6E9C3;
	Wed, 10 Mar 2021 06:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F085A6E9C3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 06:20:26 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id o10so10705694pgg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Mar 2021 22:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4d8sR7QoUqa4Mq8S/CwYn8P12sedIWkCOnUcns0uhRo=;
 b=sRkuW6NkoHmUJp5hYVRT345FBBuQVeRoN2pDEEM5OMASW2W7HG1BhOyS1cfAby7GzW
 Nqda+pNfe4/Xz9rKj/DZMBgYLk8lmpvJ9k6TMQT4GDTRVKKqEPEVlpss6HwMB8uGMDbE
 dvjILr/LgVk4k8zW5TFfC6dQAJOn2vcEyx8BzfuMdqO3t/Zbs+OZKyXK0Z24pJVQGqiM
 zvHVQR4LgwESRf5F2VCfdFaRhQW7YubH38ZLRfpxKwN+4xqw4pBSZQgD6cyQSFuAqbLz
 CY4ppvGnWwGvfIfL3Jdd3diBQ71P4M+fftYxL7cPK9uZcgcU7hDOdCp1NCNI+kusFIla
 tMAA==
X-Gm-Message-State: AOAM533QVsZZTHjfmwy9iqdRZDjxf8McGHGmp8uaBrk54BHSzvpzOvpf
 PxZRf/iVZBeJrne2C5kghLakO23xL8PTmCSOvoaHfg==
X-Google-Smtp-Source: ABdhPJzD/2OOodKdWzG/mGWhdHkE3zy+cxRB3tzdfaIDWO0B7V5ZsjPbCiiQTZmvX+1Xp325eeJekCIhvt2dOoJ1EQU=
X-Received: by 2002:a62:ac1a:0:b029:1f9:5ca4:dd4d with SMTP id
 v26-20020a62ac1a0000b02901f95ca4dd4dmr1446169pfe.68.1615357226312; Tue, 09
 Mar 2021 22:20:26 -0800 (PST)
MIME-Version: 1.0
References: <f9700ce86b6d893a162c099fb680cc0f@nuetzel-hh.de>
 <CABE_ZV3KwwOdsF40K8CuMNtg=1RYvst3iEp=rxQWPbOD1sXnJg@mail.gmail.com>
 <b032baca494c39890485bcef21e59413@nuetzel-hh.de>
In-Reply-To: <b032baca494c39890485bcef21e59413@nuetzel-hh.de>
From: Jan Vesely <jan.vesely@rutgers.edu>
Date: Wed, 10 Mar 2021 01:20:15 -0500
Message-ID: <CABE_ZV1YcpyfattK-9z2TJuAQLxg0w7BwU7tq_8cqe1RQ-mm1A@mail.gmail.com>
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, DRI Devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0354133295=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0354133295==
Content-Type: multipart/alternative; boundary="000000000000a9176205bd28a90f"

--000000000000a9176205bd28a90f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi,

sorry the option is actually -cl-no-stdinc. you can add it to
'target_compiler_options'.
I should have a patch ready soon(tm), but time is scarce.

Jan

On Sun, Mar 7, 2021 at 9:51 PM Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> wr=
ote:

> Hello Jan,
>
> I very much appreciate your advice.
> Tried several places...
> ...where to put it?
>
> Dieter
>
> Am 06.03.2021 17:56, schrieb Jan Vesely:
> > Not Marek, but hope this answer will help.
> > libclc uses clang CLC preprocessor on .ll files, llvm/clang-13 started
> > including clc declarations by default (clang
> > cf3ef15a6ec5e5b45c6c54e8fbe3769255e815ce),
> > thus corrupting any .ll assembly files that are used by libclc.
> > Inclusion of the default declarations can be turned off using a
> > cmdline switch but that remains to be implemented in the libclc build
> > system.
> > manually adding '-cl-no-stdinc' should work as a workaround.
> >
> > Jan
> >
> > On Thu, Mar 4, 2021 at 10:27 PM Dieter N=C3=BCtzel <Dieter@nuetzel-hh.d=
e>
> > wrote:
> >
> >> Hello Marek,
> >>
> >> can't compile anything, here.
> >> Poor Intel Nehalem X3470.
> >>
> >> Trying LLVM 12-rc2 later.
> >>
> >> Greetings,
> >> Dieter
> >>
> >> llvm-project/libclc> cd build && cmake ../
> >> -- The CXX compiler identification is GNU 10.2.1
> >> -- Detecting CXX compiler ABI info
> >> -- Detecting CXX compiler ABI info - done
> >> -- Check for working CXX compiler: /usr/bin/c++ - skipped
> >> -- Detecting CXX compile features
> >> -- Detecting CXX compile features - done
> >> LLVM version: 13.0.0git
> >> LLVM system libs:
> >> LLVM libs: -lLLVM-13git
> >> LLVM libdir: /usr/local/lib
> >> LLVM bindir: /usr/local/bin
> >> LLVM ld flags: -L/usr/local/lib
> >> LLVM cxx flags:
> >>
> >
> -I/usr/local/include;-std=3Dc++14;;;-fno-exceptions;-D_GNU_SOURCE;-D__STD=
C_CONSTANT_MACROS;-D__STDC_FORMAT_MACROS;-D__STDC_LIMIT_MACROS;-fno-rtti;-f=
no-exceptions
> >>
> >> clang: /usr/local/bin/clang
> >> llvm-as: /usr/local/bin/llvm-as
> >> llvm-link: /usr/local/bin/llvm-link
> >> opt: /usr/local/bin/opt
> >> llvm-spirv: /usr/local/bin/llvm-spirv
> >>
> >> -- Check for working CLC compiler: /usr/local/bin/clang
> >> -- Check for working CLC compiler: /usr/local/bin/clang -- works
> >> -- Check for working LLAsm compiler: /usr/local/bin/llvm-as
> >> -- Check for working LLAsm compiler: /usr/local/bin/llvm-as --
> >> broken
> >> CMake Error at cmake/CMakeTestLLAsmCompiler.cmake:40 (message):
> >> The LLAsm compiler "/usr/local/bin/llvm-as" is not able to
> >> compile a
> >> simple
> >> test program.
> >>
> >> It fails with the following output:
> >>
> >> Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp
> >>
> >> Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast &&
> >> /usr/bin/gmake
> >> -f
> >> CMakeFiles/cmTC_87af9.dir/build.make
> >> CMakeFiles/cmTC_87af9.dir/build
> >>
> >> gmake[1]: Verzeichnis
> >> =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C w=
ird
> >> betreten
> >>
> >> Building LLAsm object
> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
> >>
> >> /usr/local/bin/clang -E -P -x cl
> >>
> >>
> > /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.ll
> >>
> >> -o
> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
> >>
> >> /usr/local/bin/llvm-as -o
> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
> >>
> >> /usr/local/bin/llvm-as:
> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error:
> >> expected
> >> top-level entity
> >>
> >> typedef unsigned char uchar;
> >>
> >> ^
> >>
> >> gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86:
> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1
> >>
> >> gmake[1]: Verzeichnis
> >> =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C w=
ird
> >> verlassen
> >>
> >> gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2
> >>
> >> CMake will not be able to correctly generate this project.
> >> Call Stack (most recent call first):
> >> CMakeLists.txt:127 (enable_language)
> >>
> >> -- Configuring incomplete, errors occurred!
> >> See also
> >> "/opt/llvm-project/libclc/build/CMakeFiles/CMakeOutput.log".
> >> See also "/opt/llvm-project/libclc/build/CMakeFiles/CMakeError.log".
> >>
> >> CMakeError.log
> >> Determining if the LLAsm compiler works failed with the following
> >> output:
> >> Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp
> >>
> >> Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast &&
> >> /usr/bin/gmake
> >> -f CMakeFiles/cmTC_87af9.dir/build.make
> >> CMakeFiles/cmTC_87af9.dir/build
> >> gmake[1]: Verzeichnis
> >> =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C w=
ird
> >> betreten
> >> Building LLAsm object CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
> >> /usr/local/bin/clang -E -P     -x cl
> >>
> > /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.ll
> >>
> >> -o CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
> >> /usr/local/bin/llvm-as -o
> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
> >> /usr/local/bin/llvm-as:
> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error:
> >> expected
> >> top-level entity
> >> typedef unsigned char uchar;
> >> ^
> >> gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86:
> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1
> >> gmake[1]: Verzeichnis
> >> =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C w=
ird
> >> verlassen
> >> gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--000000000000a9176205bd28a90f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi,<div><br></div><div>sorry the option is actually -cl-no=
-stdinc. you can add it to &#39;target_compiler_options&#39;.<br>I should h=
ave a patch ready soon(tm), but time is scarce.<br><br>Jan</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar=
 7, 2021 at 9:51 PM Dieter N=C3=BCtzel &lt;<a href=3D"mailto:Dieter@nuetzel=
-hh.de">Dieter@nuetzel-hh.de</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hello Jan,<br>
<br>
I very much appreciate your advice.<br>
Tried several places...<br>
...where to put it?<br>
<br>
Dieter<br>
<br>
Am 06.03.2021 17:56, schrieb Jan Vesely:<br>
&gt; Not Marek, but hope this answer will help.<br>
&gt; libclc uses clang CLC preprocessor on .ll files, llvm/clang-13 started=
<br>
&gt; including clc declarations by default (clang<br>
&gt; cf3ef15a6ec5e5b45c6c54e8fbe3769255e815ce),<br>
&gt; thus corrupting any .ll assembly files that are used by libclc.<br>
&gt; Inclusion of the default declarations can be turned off using a<br>
&gt; cmdline switch but that remains to be implemented in the libclc build<=
br>
&gt; system.<br>
&gt; manually adding &#39;-cl-no-stdinc&#39; should work as a workaround.<b=
r>
&gt; <br>
&gt; Jan<br>
&gt; <br>
&gt; On Thu, Mar 4, 2021 at 10:27 PM Dieter N=C3=BCtzel &lt;<a href=3D"mail=
to:Dieter@nuetzel-hh.de" target=3D"_blank">Dieter@nuetzel-hh.de</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hello Marek,<br>
&gt;&gt; <br>
&gt;&gt; can&#39;t compile anything, here.<br>
&gt;&gt; Poor Intel Nehalem X3470.<br>
&gt;&gt; <br>
&gt;&gt; Trying LLVM 12-rc2 later.<br>
&gt;&gt; <br>
&gt;&gt; Greetings,<br>
&gt;&gt; Dieter<br>
&gt;&gt; <br>
&gt;&gt; llvm-project/libclc&gt; cd build &amp;&amp; cmake ../<br>
&gt;&gt; -- The CXX compiler identification is GNU 10.2.1<br>
&gt;&gt; -- Detecting CXX compiler ABI info<br>
&gt;&gt; -- Detecting CXX compiler ABI info - done<br>
&gt;&gt; -- Check for working CXX compiler: /usr/bin/c++ - skipped<br>
&gt;&gt; -- Detecting CXX compile features<br>
&gt;&gt; -- Detecting CXX compile features - done<br>
&gt;&gt; LLVM version: 13.0.0git<br>
&gt;&gt; LLVM system libs:<br>
&gt;&gt; LLVM libs: -lLLVM-13git<br>
&gt;&gt; LLVM libdir: /usr/local/lib<br>
&gt;&gt; LLVM bindir: /usr/local/bin<br>
&gt;&gt; LLVM ld flags: -L/usr/local/lib<br>
&gt;&gt; LLVM cxx flags:<br>
&gt;&gt; <br>
&gt; -I/usr/local/include;-std=3Dc++14;;;-fno-exceptions;-D_GNU_SOURCE;-D__=
STDC_CONSTANT_MACROS;-D__STDC_FORMAT_MACROS;-D__STDC_LIMIT_MACROS;-fno-rtti=
;-fno-exceptions<br>
&gt;&gt; <br>
&gt;&gt; clang: /usr/local/bin/clang<br>
&gt;&gt; llvm-as: /usr/local/bin/llvm-as<br>
&gt;&gt; llvm-link: /usr/local/bin/llvm-link<br>
&gt;&gt; opt: /usr/local/bin/opt<br>
&gt;&gt; llvm-spirv: /usr/local/bin/llvm-spirv<br>
&gt;&gt; <br>
&gt;&gt; -- Check for working CLC compiler: /usr/local/bin/clang<br>
&gt;&gt; -- Check for working CLC compiler: /usr/local/bin/clang -- works<b=
r>
&gt;&gt; -- Check for working LLAsm compiler: /usr/local/bin/llvm-as<br>
&gt;&gt; -- Check for working LLAsm compiler: /usr/local/bin/llvm-as --<br>
&gt;&gt; broken<br>
&gt;&gt; CMake Error at cmake/CMakeTestLLAsmCompiler.cmake:40 (message):<br=
>
&gt;&gt; The LLAsm compiler &quot;/usr/local/bin/llvm-as&quot; is not able =
to<br>
&gt;&gt; compile a<br>
&gt;&gt; simple<br>
&gt;&gt; test program.<br>
&gt;&gt; <br>
&gt;&gt; It fails with the following output:<br>
&gt;&gt; <br>
&gt;&gt; Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp<br>
&gt;&gt; <br>
&gt;&gt; Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast &amp;&amp;<br>
&gt;&gt; /usr/bin/gmake<br>
&gt;&gt; -f<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/build.make<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/build<br>
&gt;&gt; <br>
&gt;&gt; gmake[1]: Verzeichnis<br>
&gt;&gt; =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=
=9C wird<br>
&gt;&gt; betreten<br>
&gt;&gt; <br>
&gt;&gt; Building LLAsm object<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc<br>
&gt;&gt; <br>
&gt;&gt; /usr/local/bin/clang -E -P -x cl<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt; /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.l=
l<br>
&gt;&gt; <br>
&gt;&gt; -o<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp<br>
&gt;&gt; <br>
&gt;&gt; /usr/local/bin/llvm-as -o<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp<br>
&gt;&gt; <br>
&gt;&gt; /usr/local/bin/llvm-as:<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error:<br=
>
&gt;&gt; expected<br>
&gt;&gt; top-level entity<br>
&gt;&gt; <br>
&gt;&gt; typedef unsigned char uchar;<br>
&gt;&gt; <br>
&gt;&gt; ^<br>
&gt;&gt; <br>
&gt;&gt; gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86:<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1<br>
&gt;&gt; <br>
&gt;&gt; gmake[1]: Verzeichnis<br>
&gt;&gt; =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=
=9C wird<br>
&gt;&gt; verlassen<br>
&gt;&gt; <br>
&gt;&gt; gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2<br>
&gt;&gt; <br>
&gt;&gt; CMake will not be able to correctly generate this project.<br>
&gt;&gt; Call Stack (most recent call first):<br>
&gt;&gt; CMakeLists.txt:127 (enable_language)<br>
&gt;&gt; <br>
&gt;&gt; -- Configuring incomplete, errors occurred!<br>
&gt;&gt; See also<br>
&gt;&gt; &quot;/opt/llvm-project/libclc/build/CMakeFiles/CMakeOutput.log&qu=
ot;.<br>
&gt;&gt; See also &quot;/opt/llvm-project/libclc/build/CMakeFiles/CMakeErro=
r.log&quot;.<br>
&gt;&gt; <br>
&gt;&gt; CMakeError.log<br>
&gt;&gt; Determining if the LLAsm compiler works failed with the following<=
br>
&gt;&gt; output:<br>
&gt;&gt; Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp<br>
&gt;&gt; <br>
&gt;&gt; Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast &amp;&amp;<br>
&gt;&gt; /usr/bin/gmake<br>
&gt;&gt; -f CMakeFiles/cmTC_87af9.dir/build.make<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/build<br>
&gt;&gt; gmake[1]: Verzeichnis<br>
&gt;&gt; =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=
=9C wird<br>
&gt;&gt; betreten<br>
&gt;&gt; Building LLAsm object CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.=
bc<br>
&gt;&gt; /usr/local/bin/clang -E -P=C2=A0 =C2=A0 =C2=A0-x cl<br>
&gt;&gt; <br>
&gt; /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.l=
l<br>
&gt;&gt; <br>
&gt;&gt; -o CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp<br>
&gt;&gt; /usr/local/bin/llvm-as -o<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp<br>
&gt;&gt; /usr/local/bin/llvm-as:<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error:<br=
>
&gt;&gt; expected<br>
&gt;&gt; top-level entity<br>
&gt;&gt; typedef unsigned char uchar;<br>
&gt;&gt; ^<br>
&gt;&gt; gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86:<br>
&gt;&gt; CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1<br>
&gt;&gt; gmake[1]: Verzeichnis<br>
&gt;&gt; =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=
=9C wird<br>
&gt;&gt; verlassen<br>
&gt;&gt; gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; dri-devel mailing list<br>
&gt;&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blan=
k">dri-devel@lists.freedesktop.org</a><br>
&gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-deve=
l" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailm=
an/listinfo/dri-devel</a><br>
</blockquote></div>

--000000000000a9176205bd28a90f--

--===============0354133295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0354133295==--
