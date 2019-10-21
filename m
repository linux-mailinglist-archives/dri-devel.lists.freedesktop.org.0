Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36EDF8C1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 01:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8D66E2DC;
	Mon, 21 Oct 2019 23:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 43C7C6E2DC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 23:46:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 40854720E2; Mon, 21 Oct 2019 23:46:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112008] eDP -> Dual Channel LVDS bridge unable to accept any
 modelines: Corrupt display!
Date: Mon, 21 Oct 2019 23:46:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: Babblebones@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112008-502-6c8dIuA9la@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112008-502@http.bugs.freedesktop.org/>
References: <bug-112008-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1742354665=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1742354665==
Content-Type: multipart/alternative; boundary="15717015781.7889aF5A.6137"
Content-Transfer-Encoding: 7bit


--15717015781.7889aF5A.6137
Date: Mon, 21 Oct 2019 23:46:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112008

--- Comment #6 from Babblebones@gmail.com ---
This may be useful to you!


[    4.603742] [drm:amdgpu_dm_initialize_drm_device [amdgpu]]
amdgpu_dm_connector_init()
[    4.604326] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0000, Side=
Band
Msg: Nop, Op res: OK
[    4.604327] Body: 11
[    4.604699] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0000, Side=
Band
Msg: Nop, Op res: OK
[    4.604699] Body: 11 06 84 00 01 00 00 00 00 00 00 00 00 00 00 00
[    4.604932] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0000, Side=
Band
Msg: Nop, Op res: OK
[    4.604933] Body: 11
[    4.605160] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0200, Side=
Band
Msg: Nop, Op res: OK
[    4.605161] Body: 41
[    4.605393] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0000, Side=
Band
Msg: Nop, Op res: OK
[    4.605394] Body: 11
[    4.605700] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0400, Side=
Band
Msg: Nop, Op res: OK
[    4.605700] Body: 00 00 00 00 00 00 00 00 00
[    4.605933] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0000, Side=
Band
Msg: Nop, Op res: OK
[    4.605933] Body: 11
[    4.606178] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0409, Side=
Band
Msg: Nop, Op res: OK
[    4.606178] Body: 00 00 00
[    4.606218] [drm:dc_conn_log_hex_linux [amdgpu]] 11=20
[    4.606257] [drm:dc_conn_log_hex_linux [amdgpu]] 06=20
[    4.606296] [drm:dc_conn_log_hex_linux [amdgpu]] 84=20
[    4.606334] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606372] [drm:dc_conn_log_hex_linux [amdgpu]] 01=20
[    4.606410] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606447] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606485] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606522] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606560] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606597] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606635] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606672] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606710] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606748] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606786] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606825] [drm:retrieve_link_cap [amdgpu]] Rx Caps:=20
[    4.607189] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.607192] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.607559] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.607561] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.607925] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.607926] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.608290] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.608291] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.608661] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.608662] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.609021] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.609022] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.609381] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.609383] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.609741] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.609742] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.610189] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.610190] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.610549] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.610550] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.610587] [drm:dc_link_detect [amdgpu]] *ERROR* No EDID read.


Kernel 4.19 Gentoo stock

Any idea why dc_conn_log_hex_linux is so short?
Other people's connectors seem to get lots of hex data over the debug drop =
here
mine is nearly completely empty!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15717015781.7889aF5A.6137
Date: Mon, 21 Oct 2019 23:46:18 +0000
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
   title=3D"NEW - eDP -&gt; Dual Channel LVDS bridge unable to accept any m=
odelines: Corrupt display!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112008#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - eDP -&gt; Dual Channel LVDS bridge unable to accept any m=
odelines: Corrupt display!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112008">bug 11200=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Babblebones&#64;gmail.com" title=3D"Babblebones&#64;gmail.com">Babblebones&=
#64;gmail.com</a>
</span></b>
        <pre>This may be useful to you!


[    4.603742] [drm:amdgpu_dm_initialize_drm_device [amdgpu]]
amdgpu_dm_connector_init()
[    4.604326] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0000, Side=
Band
Msg: Nop, Op res: OK
[    4.604327] Body: 11
[    4.604699] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0000, Side=
Band
Msg: Nop, Op res: OK
[    4.604699] Body: 11 06 84 00 01 00 00 00 00 00 00 00 00 00 00 00
[    4.604932] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0000, Side=
Band
Msg: Nop, Op res: OK
[    4.604933] Body: 11
[    4.605160] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0200, Side=
Band
Msg: Nop, Op res: OK
[    4.605161] Body: 41
[    4.605393] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0000, Side=
Band
Msg: Nop, Op res: OK
[    4.605394] Body: 11
[    4.605700] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0400, Side=
Band
Msg: Nop, Op res: OK
[    4.605700] Body: 00 00 00 00 00 00 00 00 00
[    4.605933] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0000, Side=
Band
Msg: Nop, Op res: OK
[    4.605933] Body: 11
[    4.606178] [drm:dm_dp_aux_transfer [amdgpu]] Op: Read, addr: 0409, Side=
Band
Msg: Nop, Op res: OK
[    4.606178] Body: 00 00 00
[    4.606218] [drm:dc_conn_log_hex_linux [amdgpu]] 11=20
[    4.606257] [drm:dc_conn_log_hex_linux [amdgpu]] 06=20
[    4.606296] [drm:dc_conn_log_hex_linux [amdgpu]] 84=20
[    4.606334] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606372] [drm:dc_conn_log_hex_linux [amdgpu]] 01=20
[    4.606410] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606447] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606485] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606522] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606560] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606597] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606635] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606672] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606710] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606748] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606786] [drm:dc_conn_log_hex_linux [amdgpu]] 00=20
[    4.606825] [drm:retrieve_link_cap [amdgpu]] Rx Caps:=20
[    4.607189] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.607192] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.607559] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.607561] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.607925] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.607926] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.608290] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.608291] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.608661] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.608662] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.609021] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.609022] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.609381] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.609383] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.609741] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.609742] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.610189] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.610190] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.610549] [drm:dm_dp_aux_transfer [amdgpu]] Op: Write, addr: 0050,
SideBand Msg: Nop, Op res: OK
[    4.610550] [drm:drm_dp_i2c_do_msg] I2C nack (result=3D0, size=3D0
[    4.610587] [drm:dc_link_detect [amdgpu]] *ERROR* No EDID read.


Kernel 4.19 Gentoo stock

Any idea why dc_conn_log_hex_linux is so short?
Other people's connectors seem to get lots of hex data over the debug drop =
here
mine is nearly completely empty!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15717015781.7889aF5A.6137--

--===============1742354665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1742354665==--
