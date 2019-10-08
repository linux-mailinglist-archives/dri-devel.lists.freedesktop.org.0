Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B651ED022A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 22:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93C76E266;
	Tue,  8 Oct 2019 20:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 55AAD6E266
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 20:32:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4C25672162; Tue,  8 Oct 2019 20:32:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111932] driconf: TypeError: cannot concatenate 'str' and 'int'
 objects
Date: Tue, 08 Oct 2019 20:32:12 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: General
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: mmokrejs@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111932-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0196140531=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0196140531==
Content-Type: multipart/alternative; boundary="15705667360.c71DccBC1.9775"
Content-Transfer-Encoding: 7bit


--15705667360.c71DccBC1.9775
Date: Tue, 8 Oct 2019 20:32:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111932

            Bug ID: 111932
           Summary: driconf: TypeError: cannot concatenate 'str' and 'int'
                    objects
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: General
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mmokrejs@gmail.com

$ driconf --version
Screen "0" is not direct rendering capable.
MESA-LOADER: failed to open radeon (search paths /usr/lib64/dri)
Traceback (most recent call last):
  File "/usr/lib/python-exec/python2.7/driconf", line 28, in <module>
    driconf.main()
  File "/usr/lib/driconf/driconf.py", line 140, in main
    complexui.start(configList)
  File "/usr/lib/driconf/driconf_complexui.py", line 1040, in start
    mainWindow =3D MainWindow(configList)
  File "/usr/lib/driconf/driconf_complexui.py", line 830, in __init__
    self.configTree =3D ConfigTreeView (configList)
  File "/usr/lib/driconf/driconf_complexui.py", line 525, in __init__
    self.model =3D ConfigTreeModel (configList)
  File "/usr/lib/driconf/driconf_complexui.py", line 262, in __init__
    self.addNode (config)
  File "/usr/lib/driconf/driconf_complexui.py", line 450, in addNode
    self.initNode (node)
  File "/usr/lib/driconf/driconf_complexui.py", line 469, in initNode
    self.initNode (device)
  File "/usr/lib/driconf/driconf_complexui.py", line 472, in initNode
    self.initNode (app)
  File "/usr/lib/driconf/driconf_complexui.py", line 474, in initNode
    self.validateAppNode (node)
  File "/usr/lib/driconf/driconf_complexui.py", line 515, in validateAppNode
    driver =3D app.device.getDriver(commonui.dpy)
  File "/usr/lib/driconf/dri.py", line 490, in getDriver
    driver =3D GetDriver (self.driver)
  File "/usr/lib/driconf/dri.py", line 430, in GetDriver
    driver =3D DriverInfo (name)
  File "/usr/lib/driconf/dri.py", line 292, in __init__
    driInfo =3D XDriInfo ("options " + name)
  File "/usr/lib/driconf/dri.py", line 54, in XDriInfo
    raise DRIError ("XDriInfo killed by signal " + signal + ".")
TypeError: cannot concatenate 'str' and 'int' objects
$ equery belongs driconf
 * Searching for driconf ...=20
x11-misc/driconf-0.9.1-r2 (/usr/share/driconf)
x11-misc/driconf-0.9.1-r2 (/usr/lib/python-exec/python2.7/driconf)
x11-misc/driconf-0.9.1-r2 (/usr/bin/driconf -> ../lib/python-exec/python-ex=
ec2)
x11-misc/driconf-0.9.1-r2 (/usr/lib/driconf)
$

This is a Gentoo Linux. Actually the '--version' argument does not matter, =
it
crashes even without it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15705667360.c71DccBC1.9775
Date: Tue, 8 Oct 2019 20:32:16 +0000
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
   title=3D"NEW - driconf: TypeError: cannot concatenate 'str' and 'int' ob=
jects"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111932">111932</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>driconf: TypeError: cannot concatenate 'str' and 'int' objects
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
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
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>General
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mmokrejs&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>$ driconf --version
Screen &quot;0&quot; is not direct rendering capable.
MESA-LOADER: failed to open radeon (search paths /usr/lib64/dri)
Traceback (most recent call last):
  File &quot;/usr/lib/python-exec/python2.7/driconf&quot;, line 28, in &lt;=
module&gt;
    driconf.main()
  File &quot;/usr/lib/driconf/driconf.py&quot;, line 140, in main
    complexui.start(configList)
  File &quot;/usr/lib/driconf/driconf_complexui.py&quot;, line 1040, in sta=
rt
    mainWindow =3D MainWindow(configList)
  File &quot;/usr/lib/driconf/driconf_complexui.py&quot;, line 830, in __in=
it__
    self.configTree =3D ConfigTreeView (configList)
  File &quot;/usr/lib/driconf/driconf_complexui.py&quot;, line 525, in __in=
it__
    self.model =3D ConfigTreeModel (configList)
  File &quot;/usr/lib/driconf/driconf_complexui.py&quot;, line 262, in __in=
it__
    self.addNode (config)
  File &quot;/usr/lib/driconf/driconf_complexui.py&quot;, line 450, in addN=
ode
    self.initNode (node)
  File &quot;/usr/lib/driconf/driconf_complexui.py&quot;, line 469, in init=
Node
    self.initNode (device)
  File &quot;/usr/lib/driconf/driconf_complexui.py&quot;, line 472, in init=
Node
    self.initNode (app)
  File &quot;/usr/lib/driconf/driconf_complexui.py&quot;, line 474, in init=
Node
    self.validateAppNode (node)
  File &quot;/usr/lib/driconf/driconf_complexui.py&quot;, line 515, in vali=
dateAppNode
    driver =3D app.device.getDriver(commonui.dpy)
  File &quot;/usr/lib/driconf/dri.py&quot;, line 490, in getDriver
    driver =3D GetDriver (self.driver)
  File &quot;/usr/lib/driconf/dri.py&quot;, line 430, in GetDriver
    driver =3D DriverInfo (name)
  File &quot;/usr/lib/driconf/dri.py&quot;, line 292, in __init__
    driInfo =3D XDriInfo (&quot;options &quot; + name)
  File &quot;/usr/lib/driconf/dri.py&quot;, line 54, in XDriInfo
    raise DRIError (&quot;XDriInfo killed by signal &quot; + signal + &quot=
;.&quot;)
TypeError: cannot concatenate 'str' and 'int' objects
$ equery belongs driconf
 * Searching for driconf ...=20
x11-misc/driconf-0.9.1-r2 (/usr/share/driconf)
x11-misc/driconf-0.9.1-r2 (/usr/lib/python-exec/python2.7/driconf)
x11-misc/driconf-0.9.1-r2 (/usr/bin/driconf -&gt; ../lib/python-exec/python=
-exec2)
x11-misc/driconf-0.9.1-r2 (/usr/lib/driconf)
$

This is a Gentoo Linux. Actually the '--version' argument does not matter, =
it
crashes even without it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15705667360.c71DccBC1.9775--

--===============0196140531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0196140531==--
