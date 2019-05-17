Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5726821EC3
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 21:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF7A890D5;
	Fri, 17 May 2019 19:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D302890D5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 19:48:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 92FD372167; Fri, 17 May 2019 19:48:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110702] segfault in radeonsi HEVC hardware decoding
Date: Fri, 17 May 2019 19:48:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-bugzilla@ossman.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110702-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0497275456=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0497275456==
Content-Type: multipart/alternative; boundary="15581224950.C81019b.10013"
Content-Transfer-Encoding: 7bit


--15581224950.C81019b.10013
Date: Fri, 17 May 2019 19:48:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110702

            Bug ID: 110702
           Summary: segfault in radeonsi HEVC hardware decoding
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: pierre-bugzilla@ossman.eu
        QA Contact: dri-devel@lists.freedesktop.org

A few HEVC files gives me a segfault in radeonsi_dri.so when trying to play
them via Kodi. They work fine when decoding in software, and other HEVC fil=
es
work fine being decoded in hardware. I do not know what is special about th=
ese
files.

> amdgpu: Failed to allocate a buffer:
> amdgpu:    size      : 3221295104 bytes
> amdgpu:    alignment : 4096 bytes
> amdgpu:    domains   : 4
> amdgpu: Failed to allocate a buffer:
> amdgpu:    size      : 3221295104 bytes
> amdgpu:    alignment : 4096 bytes
> amdgpu:    domains   : 4
> EE ../src/gallium/drivers/radeon/radeon_vcn_dec.c:880 rvcn_dec_message_de=
code UVD - Can't allocated context buffer.
> /usr/bin/kodi: line 219:  1223 Segmentation fault      (core dumped) ${KO=
DI_BINARY} $SAVED_ARGS

Lines seen in ~/.xsession-errors

This is the details Kodi reports about the video:

> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
  Metadata:
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
    ENCODER         : Lavf58.27.102
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
  Duration: 01:29:45.38, start: 0.000000, bitrate: 1598 kb/s
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
    Stream #0:0(eng): Video: hevc (Main 10), yuv420p10le(tv), 1920x1080 [SA=
R 1:1 DAR 16:9], 23.98 fps, 23.98 tbr, 1k tbn, 23.98 tbc (default)
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
    Metadata:
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      BPS-eng         : 8246896
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      DURATION-eng    : 01:29:45.380000000
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      NUMBER_OF_FRAMES-eng: 129120
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      NUMBER_OF_BYTES-eng: 5551584033
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      _STATISTICS_WRITING_APP-eng: mkvmerge v33.1.0 ('Primrose') 64-bit
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      _STATISTICS_WRITING_DATE_UTC-eng: 2019-05-13 00:59:51
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      _STATISTICS_TAGS-eng: BPS DURATION NUMBER_OF_FRAMES NUMBER_OF_BYTES
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      ENCODER         : Lavc58.51.100 libx265
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      DURATION        : 01:29:45.380000000
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
    Stream #0:1(eng): Audio: eac3, 48000 Hz, 6 channels, fltp (default)
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
    Metadata:
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      BPS-eng         : 640000
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      DURATION-eng    : 01:29:45.376000000
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      NUMBER_OF_FRAMES-eng: 168293
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      NUMBER_OF_BYTES-eng: 430830080
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      _STATISTICS_WRITING_APP-eng: mkvmerge v33.1.0 ('Primrose') 64-bit
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      _STATISTICS_WRITING_DATE_UTC-eng: 2019-05-13 00:59:51
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      _STATISTICS_TAGS-eng: BPS DURATION NUMBER_OF_FRAMES NUMBER_OF_BYTES
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      DURATION        : 01:29:45.384000000
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
    Stream #0:2(eng): Subtitle: ass
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
    Metadata:
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      BPS-eng         : 38
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      DURATION-eng    : 01:29:38.000000000
> 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      NUMBER_OF_FRAMES-eng: 955
> 2019-05-17 19:51:31.905 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      NUMBER_OF_BYTES-eng: 26165
> 2019-05-17 19:51:31.905 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      _STATISTICS_WRITING_APP-eng: mkvmerge v33.1.0 ('Primrose') 64-bit
> 2019-05-17 19:51:31.905 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      _STATISTICS_WRITING_DATE_UTC-eng: 2019-05-13 00:59:51
> 2019-05-17 19:51:31.905 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      _STATISTICS_TAGS-eng: BPS DURATION NUMBER_OF_FRAMES NUMBER_OF_BYTES
> 2019-05-17 19:51:31.905 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      ENCODER         : Lavc58.51.100 ssa
> 2019-05-17 19:51:31.905 T:140684663195392    INFO: ffmpeg[7FF3B3600700]: =
      DURATION        : 01:29:42.162000000

This is with mesa-dri-drivers-19.0.4-1.fc30.x86_64.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15581224950.C81019b.10013
Date: Fri, 17 May 2019 19:48:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - segfault in radeonsi HEVC hardware decoding"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110702">110702</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>segfault in radeonsi HEVC hardware decoding
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>pierre-bugzilla&#64;ossman.eu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>A few HEVC files gives me a segfault in radeonsi_dri.so when t=
rying to play
them via Kodi. They work fine when decoding in software, and other HEVC fil=
es
work fine being decoded in hardware. I do not know what is special about th=
ese
files.

<span class=3D"quote">&gt; amdgpu: Failed to allocate a buffer:
&gt; amdgpu:    size      : 3221295104 bytes
&gt; amdgpu:    alignment : 4096 bytes
&gt; amdgpu:    domains   : 4
&gt; amdgpu: Failed to allocate a buffer:
&gt; amdgpu:    size      : 3221295104 bytes
&gt; amdgpu:    alignment : 4096 bytes
&gt; amdgpu:    domains   : 4
&gt; EE ../src/gallium/drivers/radeon/radeon_vcn_dec.c:880 rvcn_dec_message=
_decode UVD - Can't allocated context buffer.
&gt; /usr/bin/kodi: line 219:  1223 Segmentation fault      (core dumped) $=
{KODI_BINARY} $SAVED_ARGS</span >

Lines seen in ~/.xsession-errors

This is the details Kodi reports about the video:

<span class=3D"quote">&gt; 2019-05-17 19:51:31.904 T:140684663195392    INF=
O: ffmpeg[7FF3B3600700]:   Metadata:
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:     ENCODER         : Lavf58.27.102
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:   Duration: 01:29:45.38, start: 0.000000, bitrate: 1598 kb/s
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:     Stream #0:0(eng): Video: hevc (Main 10), yuv420p10le(tv), 1920x1080 =
[SAR 1:1 DAR 16:9], 23.98 fps, 23.98 tbr, 1k tbn, 23.98 tbc (default)
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:     Metadata:
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       BPS-eng         : 8246896
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       DURATION-eng    : 01:29:45.380000000
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       NUMBER_OF_FRAMES-eng: 129120
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       NUMBER_OF_BYTES-eng: 5551584033
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       _STATISTICS_WRITING_APP-eng: mkvmerge v33.1.0 ('Primrose') 64-bit
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       _STATISTICS_WRITING_DATE_UTC-eng: 2019-05-13 00:59:51
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       _STATISTICS_TAGS-eng: BPS DURATION NUMBER_OF_FRAMES NUMBER_OF_BYTES
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       ENCODER         : Lavc58.51.100 libx265
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       DURATION        : 01:29:45.380000000
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:     Stream #0:1(eng): Audio: eac3, 48000 Hz, 6 channels, fltp (default)
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:     Metadata:
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       BPS-eng         : 640000
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       DURATION-eng    : 01:29:45.376000000
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       NUMBER_OF_FRAMES-eng: 168293
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       NUMBER_OF_BYTES-eng: 430830080
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       _STATISTICS_WRITING_APP-eng: mkvmerge v33.1.0 ('Primrose') 64-bit
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       _STATISTICS_WRITING_DATE_UTC-eng: 2019-05-13 00:59:51
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       _STATISTICS_TAGS-eng: BPS DURATION NUMBER_OF_FRAMES NUMBER_OF_BYTES
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       DURATION        : 01:29:45.384000000
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:     Stream #0:2(eng): Subtitle: ass
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:     Metadata:
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       BPS-eng         : 38
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       DURATION-eng    : 01:29:38.000000000
&gt; 2019-05-17 19:51:31.904 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       NUMBER_OF_FRAMES-eng: 955
&gt; 2019-05-17 19:51:31.905 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       NUMBER_OF_BYTES-eng: 26165
&gt; 2019-05-17 19:51:31.905 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       _STATISTICS_WRITING_APP-eng: mkvmerge v33.1.0 ('Primrose') 64-bit
&gt; 2019-05-17 19:51:31.905 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       _STATISTICS_WRITING_DATE_UTC-eng: 2019-05-13 00:59:51
&gt; 2019-05-17 19:51:31.905 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       _STATISTICS_TAGS-eng: BPS DURATION NUMBER_OF_FRAMES NUMBER_OF_BYTES
&gt; 2019-05-17 19:51:31.905 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       ENCODER         : Lavc58.51.100 ssa
&gt; 2019-05-17 19:51:31.905 T:140684663195392    INFO: ffmpeg[7FF3B3600700=
]:       DURATION        : 01:29:42.162000000</span >

This is with mesa-dri-drivers-19.0.4-1.fc30.x86_64.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15581224950.C81019b.10013--

--===============0497275456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0497275456==--
