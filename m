Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406A0197BD
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 06:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828E689728;
	Fri, 10 May 2019 04:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4672989728
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 04:40:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 42E4C7215A; Fri, 10 May 2019 04:40:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110637] Any OpenCL application causes "*ERROR* ring gfx
 timeout" on Vega 64
Date: Fri, 10 May 2019 04:40:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mezin.alexander@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110637-502-vkyZOvseYh@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110637-502@http.bugs.freedesktop.org/>
References: <bug-110637-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0872773155=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0872773155==
Content-Type: multipart/alternative; boundary="15574632421.Ac00B8DCb.27877"
Content-Transfer-Encoding: 7bit


--15574632421.Ac00B8DCb.27877
Date: Fri, 10 May 2019 04:40:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110637

--- Comment #7 from Alexander Mezin <mezin.alexander@gmail.com> ---
(In reply to Jan Vesely from comment #6)
> Can you post the output of 'clinfo'?

Sure

Number of platforms                               1
  Platform Name                                   Clover
  Platform Vendor                                 Mesa
  Platform Version                                OpenCL 1.1 Mesa 19.0.4
  Platform Profile                                FULL_PROFILE
  Platform Extensions                             cl_khr_icd
  Platform Extensions function suffix             MESA

  Platform Name                                   Clover
Number of devices                                 1
  Device Name                                     Radeon RX Vega (VEGA10, D=
RM
3.30.0, 5.1.0-arch1-1-ARCH, LLVM 8.0.0)
  Device Vendor                                   AMD
  Device Vendor ID                                0x1002
  Device Version                                  OpenCL 1.1 Mesa 19.0.4
  Driver Version                                  19.0.4
  Device OpenCL C Version                         OpenCL C 1.1=20
  Device Type                                     GPU
  Device Profile                                  FULL_PROFILE
  Device Available                                Yes
  Compiler Available                              Yes
  Max compute units                               64
  Max clock frequency                             1630MHz
  Max work item dimensions                        3
  Max work item sizes                             256x256x256
  Max work group size                             256
  Preferred work group size multiple              64
  Preferred / native vector sizes=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
    char                                                16 / 16=20=20=20=20=
=20=20
    short                                                8 / 8=20=20=20=20=
=20=20=20
    int                                                  4 / 4=20=20=20=20=
=20=20=20
    long                                                 2 / 2=20=20=20=20=
=20=20=20
    half                                                 8 / 8=20=20=20=20=
=20=20=20
(cl_khr_fp16)
    float                                                4 / 4=20=20=20=20=
=20=20=20
    double                                               2 / 2=20=20=20=20=
=20=20=20
(cl_khr_fp64)
  Half-precision Floating-point support           (cl_khr_fp16)
    Denormals                                     No
    Infinity and NANs                             Yes
    Round to nearest                              Yes
    Round to zero                                 No
    Round to infinity                             No
    IEEE754-2008 fused multiply-add               No
    Support is emulated in software               No
  Single-precision Floating-point support         (core)
    Denormals                                     No
    Infinity and NANs                             Yes
    Round to nearest                              Yes
    Round to zero                                 No
    Round to infinity                             No
    IEEE754-2008 fused multiply-add               No
    Support is emulated in software               No
    Correctly-rounded divide and sqrt operations  No
  Double-precision Floating-point support         (cl_khr_fp64)
    Denormals                                     Yes
    Infinity and NANs                             Yes
    Round to nearest                              Yes
    Round to zero                                 Yes
    Round to infinity                             Yes
    IEEE754-2008 fused multiply-add               Yes
    Support is emulated in software               No
  Address bits                                    64, Little-Endian
  Global memory size                              8573157376 (7.984GiB)
  Error Correction support                        No
  Max memory allocation                           6858525900 (6.387GiB)
  Unified memory for Host and Device              No
  Minimum alignment for any data type             128 bytes
  Alignment of base address                       32768 bits (4096 bytes)
  Global Memory cache type                        None
  Image support                                   No
  Local memory type                               Local
  Local memory size                               32768 (32KiB)
  Max number of constant args                     16
  Max constant buffer size                        2147483647 (2GiB)
  Max size of kernel argument                     1024
  Queue properties=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
    Out-of-order execution                        No
    Profiling                                     Yes
  Profiling timer resolution                      0ns
  Execution capabilities=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
    Run OpenCL kernels                            Yes
    Run native kernels                            No
  Device Extensions                               cl_khr_byte_addressable_s=
tore
cl_khr_global_int32_base_atomics cl_khr_global_int32_extended_atomics
cl_khr_local_int32_base_atomics cl_khr_local_int32_extended_atomics
cl_khr_int64_base_atomics cl_khr_int64_extended_atomics cl_khr_fp64 cl_khr_=
fp16

NULL platform behavior
  clGetPlatformInfo(NULL, CL_PLATFORM_NAME, ...)  Clover
  clGetDeviceIDs(NULL, CL_DEVICE_TYPE_ALL, ...)   Success [MESA]
  clCreateContext(NULL, ...) [default]            Success [MESA]
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_DEFAULT)  Success (1)
    Platform Name                                 Clover
    Device Name                                   Radeon RX Vega (VEGA10, D=
RM
3.30.0, 5.1.0-arch1-1-ARCH, LLVM 8.0.0)
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_CPU)  No devices found in
platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_GPU)  Success (1)
    Platform Name                                 Clover
    Device Name                                   Radeon RX Vega (VEGA10, D=
RM
3.30.0, 5.1.0-arch1-1-ARCH, LLVM 8.0.0)
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_ACCELERATOR)  No devices fou=
nd
in platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_CUSTOM)  No devices found in
platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_ALL)  Success (1)
    Platform Name                                 Clover
    Device Name                                   Radeon RX Vega (VEGA10, D=
RM
3.30.0, 5.1.0-arch1-1-ARCH, LLVM 8.0.0)

ICD loader properties
  ICD loader Name                                 OpenCL ICD Loader
  ICD loader Vendor                               OCL Icd free software
  ICD loader Version                              2.2.12
  ICD loader Profile                              OpenCL 2.2

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15574632421.Ac00B8DCb.27877
Date: Fri, 10 May 2019 04:40:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Any OpenCL application causes &quot;*ERROR* ring gfx time=
out&quot; on Vega 64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110637#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Any OpenCL application causes &quot;*ERROR* ring gfx time=
out&quot; on Vega 64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110637">bug 11063=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mezin.alexander&#64;gmail.com" title=3D"Alexander Mezin &lt;mezin.alexander=
&#64;gmail.com&gt;"> <span class=3D"fn">Alexander Mezin</span></a>
</span></b>
        <pre>(In reply to Jan Vesely from <a href=3D"show_bug.cgi?id=3D1106=
37#c6">comment #6</a>)
<span class=3D"quote">&gt; Can you post the output of 'clinfo'?</span >

Sure

Number of platforms                               1
  Platform Name                                   Clover
  Platform Vendor                                 Mesa
  Platform Version                                OpenCL 1.1 Mesa 19.0.4
  Platform Profile                                FULL_PROFILE
  Platform Extensions                             cl_khr_icd
  Platform Extensions function suffix             MESA

  Platform Name                                   Clover
Number of devices                                 1
  Device Name                                     Radeon RX Vega (VEGA10, D=
RM
3.30.0, 5.1.0-arch1-1-ARCH, LLVM 8.0.0)
  Device Vendor                                   AMD
  Device Vendor ID                                0x1002
  Device Version                                  OpenCL 1.1 Mesa 19.0.4
  Driver Version                                  19.0.4
  Device OpenCL C Version                         OpenCL C 1.1=20
  Device Type                                     GPU
  Device Profile                                  FULL_PROFILE
  Device Available                                Yes
  Compiler Available                              Yes
  Max compute units                               64
  Max clock frequency                             1630MHz
  Max work item dimensions                        3
  Max work item sizes                             256x256x256
  Max work group size                             256
  Preferred work group size multiple              64
  Preferred / native vector sizes=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
    char                                                16 / 16=20=20=20=20=
=20=20
    short                                                8 / 8=20=20=20=20=
=20=20=20
    int                                                  4 / 4=20=20=20=20=
=20=20=20
    long                                                 2 / 2=20=20=20=20=
=20=20=20
    half                                                 8 / 8=20=20=20=20=
=20=20=20
(cl_khr_fp16)
    float                                                4 / 4=20=20=20=20=
=20=20=20
    double                                               2 / 2=20=20=20=20=
=20=20=20
(cl_khr_fp64)
  Half-precision Floating-point support           (cl_khr_fp16)
    Denormals                                     No
    Infinity and NANs                             Yes
    Round to nearest                              Yes
    Round to zero                                 No
    Round to infinity                             No
    IEEE754-2008 fused multiply-add               No
    Support is emulated in software               No
  Single-precision Floating-point support         (core)
    Denormals                                     No
    Infinity and NANs                             Yes
    Round to nearest                              Yes
    Round to zero                                 No
    Round to infinity                             No
    IEEE754-2008 fused multiply-add               No
    Support is emulated in software               No
    Correctly-rounded divide and sqrt operations  No
  Double-precision Floating-point support         (cl_khr_fp64)
    Denormals                                     Yes
    Infinity and NANs                             Yes
    Round to nearest                              Yes
    Round to zero                                 Yes
    Round to infinity                             Yes
    IEEE754-2008 fused multiply-add               Yes
    Support is emulated in software               No
  Address bits                                    64, Little-Endian
  Global memory size                              8573157376 (7.984GiB)
  Error Correction support                        No
  Max memory allocation                           6858525900 (6.387GiB)
  Unified memory for Host and Device              No
  Minimum alignment for any data type             128 bytes
  Alignment of base address                       32768 bits (4096 bytes)
  Global Memory cache type                        None
  Image support                                   No
  Local memory type                               Local
  Local memory size                               32768 (32KiB)
  Max number of constant args                     16
  Max constant buffer size                        2147483647 (2GiB)
  Max size of kernel argument                     1024
  Queue properties=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
    Out-of-order execution                        No
    Profiling                                     Yes
  Profiling timer resolution                      0ns
  Execution capabilities=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
    Run OpenCL kernels                            Yes
    Run native kernels                            No
  Device Extensions                               cl_khr_byte_addressable_s=
tore
cl_khr_global_int32_base_atomics cl_khr_global_int32_extended_atomics
cl_khr_local_int32_base_atomics cl_khr_local_int32_extended_atomics
cl_khr_int64_base_atomics cl_khr_int64_extended_atomics cl_khr_fp64 cl_khr_=
fp16

NULL platform behavior
  clGetPlatformInfo(NULL, CL_PLATFORM_NAME, ...)  Clover
  clGetDeviceIDs(NULL, CL_DEVICE_TYPE_ALL, ...)   Success [MESA]
  clCreateContext(NULL, ...) [default]            Success [MESA]
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_DEFAULT)  Success (1)
    Platform Name                                 Clover
    Device Name                                   Radeon RX Vega (VEGA10, D=
RM
3.30.0, 5.1.0-arch1-1-ARCH, LLVM 8.0.0)
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_CPU)  No devices found in
platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_GPU)  Success (1)
    Platform Name                                 Clover
    Device Name                                   Radeon RX Vega (VEGA10, D=
RM
3.30.0, 5.1.0-arch1-1-ARCH, LLVM 8.0.0)
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_ACCELERATOR)  No devices fou=
nd
in platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_CUSTOM)  No devices found in
platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_ALL)  Success (1)
    Platform Name                                 Clover
    Device Name                                   Radeon RX Vega (VEGA10, D=
RM
3.30.0, 5.1.0-arch1-1-ARCH, LLVM 8.0.0)

ICD loader properties
  ICD loader Name                                 OpenCL ICD Loader
  ICD loader Vendor                               OCL Icd free software
  ICD loader Version                              2.2.12
  ICD loader Profile                              OpenCL 2.2</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15574632421.Ac00B8DCb.27877--

--===============0872773155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0872773155==--
