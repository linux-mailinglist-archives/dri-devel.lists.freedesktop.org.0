Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEAA334499
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 18:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B17E6E20F;
	Wed, 10 Mar 2021 17:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485DF6E20F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 17:03:54 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so7836811pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 09:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6MrHtWGZYE27KKI6Wq6d78SYzIK93xqGXs3BKrhm6Pg=;
 b=rZ/MJtje+pWxm5v1UndIQ2n+QBiL/eMNLMwwzTk/dHE1JA4WrZOreTeEQDt/CfkU5I
 SHl2juSTKvpu2DPFtolJTF5LztzWs3je/kDr2cg5WyWnHWNj1z9tBHMsLkyyp6KZ9k05
 hldAkdv2Jay3+D3J73zZXj1lEJuj9eQZrBltmINNuRjpxBcc0fJwEXRl8xP1v4n/UDv4
 gGpwmmACPR1QhRKjatmz6vm53V3UkfHT1WMpouQ3Hi3ro1riK5pfHjZGkBrTAm7ggiI8
 LnXoq686DS4wc0ns10+onwrCy2QIWrs23WRWjGeRJHKZhy8lfLMXfsnHy16ohb6fhuSf
 w4ew==
X-Gm-Message-State: AOAM533e7XdiRy57QOU9S4CuO3yBL8dM4O1ZQUZiEBdScgkXel+rPhY7
 Mfg0NXplrxa3kqsV039YR5uvLzPkJFUdMQQgP402kw==
X-Google-Smtp-Source: ABdhPJyhbBxz8wHmFZJKLL8TnYtz1+CaG5MdKXcW+QsIPLknHUxHZ+DFy70dwWj7vMTTgGSdbn+9kgYtf7gybAk2djM=
X-Received: by 2002:a17:90b:794:: with SMTP id
 l20mr4420156pjz.207.1615395833773; 
 Wed, 10 Mar 2021 09:03:53 -0800 (PST)
MIME-Version: 1.0
References: <f9700ce86b6d893a162c099fb680cc0f@nuetzel-hh.de>
 <CABE_ZV3KwwOdsF40K8CuMNtg=1RYvst3iEp=rxQWPbOD1sXnJg@mail.gmail.com>
 <b032baca494c39890485bcef21e59413@nuetzel-hh.de>
 <CABE_ZV1YcpyfattK-9z2TJuAQLxg0w7BwU7tq_8cqe1RQ-mm1A@mail.gmail.com>
In-Reply-To: <CABE_ZV1YcpyfattK-9z2TJuAQLxg0w7BwU7tq_8cqe1RQ-mm1A@mail.gmail.com>
From: Jan Vesely <jan.vesely@rutgers.edu>
Date: Wed, 10 Mar 2021 12:03:42 -0500
Message-ID: <CABE_ZV0AvsZA3VsFPzi8wYhE0Rk5RDZ+boODQgA9Z+qHEX-0Tw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1406490073=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1406490073==
Content-Type: multipart/alternative; boundary="000000000000d82be705bd31a64b"

--000000000000d82be705bd31a64b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One more update. without changing any cmake files the following cmdline
should work:
cmake ../llvm-project/libclc/
-DLLVM_CONFIG=3D/usr/local/llvm-git/bin/llvm-config
-DCMAKE_LLAsm_FLAGS=3D-cl-no-stdinc -DCMAKE_CLC_FLAGS=3D-cl-no-stdinc

Jan
On Wed, Mar 10, 2021 at 1:20 AM Jan Vesely <jan.vesely@rutgers.edu> wrote:

> hi,
>
> sorry the option is actually -cl-no-stdinc. you can add it to
> 'target_compiler_options'.
> I should have a patch ready soon(tm), but time is scarce.
>
> Jan
>
> On Sun, Mar 7, 2021 at 9:51 PM Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> =
wrote:
>
>> Hello Jan,
>>
>> I very much appreciate your advice.
>> Tried several places...
>> ...where to put it?
>>
>> Dieter
>>
>> Am 06.03.2021 17:56, schrieb Jan Vesely:
>> > Not Marek, but hope this answer will help.
>> > libclc uses clang CLC preprocessor on .ll files, llvm/clang-13 started
>> > including clc declarations by default (clang
>> > cf3ef15a6ec5e5b45c6c54e8fbe3769255e815ce),
>> > thus corrupting any .ll assembly files that are used by libclc.
>> > Inclusion of the default declarations can be turned off using a
>> > cmdline switch but that remains to be implemented in the libclc build
>> > system.
>> > manually adding '-cl-no-stdinc' should work as a workaround.
>> >
>> > Jan
>> >
>> > On Thu, Mar 4, 2021 at 10:27 PM Dieter N=C3=BCtzel <Dieter@nuetzel-hh.=
de>
>> > wrote:
>> >
>> >> Hello Marek,
>> >>
>> >> can't compile anything, here.
>> >> Poor Intel Nehalem X3470.
>> >>
>> >> Trying LLVM 12-rc2 later.
>> >>
>> >> Greetings,
>> >> Dieter
>> >>
>> >> llvm-project/libclc> cd build && cmake ../
>> >> -- The CXX compiler identification is GNU 10.2.1
>> >> -- Detecting CXX compiler ABI info
>> >> -- Detecting CXX compiler ABI info - done
>> >> -- Check for working CXX compiler: /usr/bin/c++ - skipped
>> >> -- Detecting CXX compile features
>> >> -- Detecting CXX compile features - done
>> >> LLVM version: 13.0.0git
>> >> LLVM system libs:
>> >> LLVM libs: -lLLVM-13git
>> >> LLVM libdir: /usr/local/lib
>> >> LLVM bindir: /usr/local/bin
>> >> LLVM ld flags: -L/usr/local/lib
>> >> LLVM cxx flags:
>> >>
>> >
>> -I/usr/local/include;-std=3Dc++14;;;-fno-exceptions;-D_GNU_SOURCE;-D__ST=
DC_CONSTANT_MACROS;-D__STDC_FORMAT_MACROS;-D__STDC_LIMIT_MACROS;-fno-rtti;-=
fno-exceptions
>> >>
>> >> clang: /usr/local/bin/clang
>> >> llvm-as: /usr/local/bin/llvm-as
>> >> llvm-link: /usr/local/bin/llvm-link
>> >> opt: /usr/local/bin/opt
>> >> llvm-spirv: /usr/local/bin/llvm-spirv
>> >>
>> >> -- Check for working CLC compiler: /usr/local/bin/clang
>> >> -- Check for working CLC compiler: /usr/local/bin/clang -- works
>> >> -- Check for working LLAsm compiler: /usr/local/bin/llvm-as
>> >> -- Check for working LLAsm compiler: /usr/local/bin/llvm-as --
>> >> broken
>> >> CMake Error at cmake/CMakeTestLLAsmCompiler.cmake:40 (message):
>> >> The LLAsm compiler "/usr/local/bin/llvm-as" is not able to
>> >> compile a
>> >> simple
>> >> test program.
>> >>
>> >> It fails with the following output:
>> >>
>> >> Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp
>> >>
>> >> Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast &&
>> >> /usr/bin/gmake
>> >> -f
>> >> CMakeFiles/cmTC_87af9.dir/build.make
>> >> CMakeFiles/cmTC_87af9.dir/build
>> >>
>> >> gmake[1]: Verzeichnis
>> >> =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C =
wird
>> >> betreten
>> >>
>> >> Building LLAsm object
>> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
>> >>
>> >> /usr/local/bin/clang -E -P -x cl
>> >>
>> >>
>> > /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.l=
l
>> >>
>> >> -o
>> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
>> >>
>> >> /usr/local/bin/llvm-as -o
>> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
>> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
>> >>
>> >> /usr/local/bin/llvm-as:
>> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error:
>> >> expected
>> >> top-level entity
>> >>
>> >> typedef unsigned char uchar;
>> >>
>> >> ^
>> >>
>> >> gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86:
>> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1
>> >>
>> >> gmake[1]: Verzeichnis
>> >> =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C =
wird
>> >> verlassen
>> >>
>> >> gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2
>> >>
>> >> CMake will not be able to correctly generate this project.
>> >> Call Stack (most recent call first):
>> >> CMakeLists.txt:127 (enable_language)
>> >>
>> >> -- Configuring incomplete, errors occurred!
>> >> See also
>> >> "/opt/llvm-project/libclc/build/CMakeFiles/CMakeOutput.log".
>> >> See also "/opt/llvm-project/libclc/build/CMakeFiles/CMakeError.log".
>> >>
>> >> CMakeError.log
>> >> Determining if the LLAsm compiler works failed with the following
>> >> output:
>> >> Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp
>> >>
>> >> Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast &&
>> >> /usr/bin/gmake
>> >> -f CMakeFiles/cmTC_87af9.dir/build.make
>> >> CMakeFiles/cmTC_87af9.dir/build
>> >> gmake[1]: Verzeichnis
>> >> =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C =
wird
>> >> betreten
>> >> Building LLAsm object CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
>> >> /usr/local/bin/clang -E -P     -x cl
>> >>
>> > /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.l=
l
>> >>
>> >> -o CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
>> >> /usr/local/bin/llvm-as -o
>> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
>> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
>> >> /usr/local/bin/llvm-as:
>> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error:
>> >> expected
>> >> top-level entity
>> >> typedef unsigned char uchar;
>> >> ^
>> >> gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86:
>> >> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1
>> >> gmake[1]: Verzeichnis
>> >> =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C =
wird
>> >> verlassen
>> >> gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2
>> >> _______________________________________________
>> >> dri-devel mailing list
>> >> dri-devel@lists.freedesktop.org
>> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>

--000000000000d82be705bd31a64b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div>One more update. without changing a=
ny cmake files the following cmdline should work:<br>cmake ../llvm-project/=
libclc/ -DLLVM_CONFIG=3D/usr/local/llvm-git/bin/llvm-config -DCMAKE_LLAsm_F=
LAGS=3D-cl-no-stdinc -DCMAKE_CLC_FLAGS=3D-cl-no-stdinc<div><br></div><div>J=
an<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, Mar 10, 2021 at 1:20 AM Jan Vesely &lt;<a href=3D"mailto:jan.vesely@rut=
gers.edu">jan.vesely@rutgers.edu</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">hi,<div><br></div><div>so=
rry the option is actually -cl-no-stdinc. you can add it to &#39;target_com=
piler_options&#39;.<br>I should have a patch ready soon(tm), but time is sc=
arce.<br><br>Jan</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sun, Mar 7, 2021 at 9:51 PM Dieter N=C3=BCtzel &lt=
;<a href=3D"mailto:Dieter@nuetzel-hh.de" target=3D"_blank">Dieter@nuetzel-h=
h.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hello Jan,<br>
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
</blockquote></div></div></div>

--000000000000d82be705bd31a64b--

--===============1406490073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1406490073==--
