Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B595038C07F
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 09:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590256F5C2;
	Fri, 21 May 2021 07:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC33D6F5C1;
 Fri, 21 May 2021 07:13:35 +0000 (UTC)
IronPort-SDR: /ZbjbTsH1fJ54POkF64fmogaKqQJkSgctTO2T+q0O0BHFmKxKEAFHBta8lhnMtH1sueUrbC6XV
 k+uR2UM2t+Og==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="188550520"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="188550520"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 00:13:32 -0700
IronPort-SDR: BUQBaLf5kQ7GMMasvdC3eDzHHt5K0Wwm8t1hOHzN5dhq7TyzYeLKDrbBS9QX3H2yR4N7+PFRGG
 6W4GN3BhBinA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="475584926"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by fmsmga002.fm.intel.com with ESMTP; 21 May 2021 00:13:28 -0700
Received: from irsmsx603.ger.corp.intel.com (163.33.146.9) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 21 May 2021 08:13:27 +0100
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9]) by
 irsmsx603.ger.corp.intel.com ([163.33.146.9]) with mapi id 15.01.2242.008;
 Fri, 21 May 2021 08:13:27 +0100
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: Chris Chiu <chris.chiu@canonical.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>
Subject: RE: [Intel-gfx] NVIDIA GPU fallen off the bus after exiting s2idle
Thread-Topic: [Intel-gfx] NVIDIA GPU fallen off the bus after exiting s2idle
Thread-Index: AQHXTfY04tpq62Sg5UipcvghO8S7LarthXrw
Date: Fri, 21 May 2021 07:13:26 +0000
Message-ID: <1953f07d15db4fda8a40e5ca752bef96@intel.com>
References: <CABTNMG0Y5iAD4E8XFkOwrNTBHNDcNKRt=+BLPHs4tw5O2eVBDA@mail.gmail.com>
 <CAJZ5v0hqU4xc8oCWXPBYhdGdG__=15+M67QWVSfFeUR3DN4Evw@mail.gmail.com>
 <CABTNMG12A5qJ5ygtFTa7Sk-5W=fmMxt0L90=04H5qRDD4vWGRQ@mail.gmail.com>
In-Reply-To: <CABTNMG12A5qJ5ygtFTa7Sk-5W=fmMxt0L90=04H5qRDD4vWGRQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
x-originating-ip: [10.184.70.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "Brown, Len" <len.brown@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 "Westerberg, Mika" <mika.westerberg@intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, Bjorn
 Helgaas <bhelgaas@google.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=20

> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ch=
ris Chiu
> Sent: perjantai 21. toukokuuta 2021 7.02
> To: Rafael J. Wysocki <rafael@kernel.org>
> Cc: Brown, Len <len.brown@intel.com>; Karol Herbst <kherbst@redhat.com>; =
Linux
> PM <linux-pm@vger.kernel.org>; Linux PCI <linux-pci@vger.kernel.org>;
> Westerberg, Mika <mika.westerberg@intel.com>; Rafael J. Wysocki
> <rjw@rjwysocki.net>; dri-devel <dri-devel@lists.freedesktop.org>; Bjorn H=
elgaas
> <bhelgaas@google.com>; intel-gfx@lists.freedesktop.org
> Subject: Re: [Intel-gfx] NVIDIA GPU fallen off the bus after exiting s2id=
le
>=20
> On Thu, May 6, 2021 at 5:46 PM Rafael J. Wysocki <rafael@kernel.org> wrot=
e:
> >
> > On Tue, May 4, 2021 at 10:08 AM Chris Chiu <chris.chiu@canonical.com> w=
rote:
> > >
> > > Hi,
> > >     We have some Intel laptops (11th generation CPU) with NVIDIA GPU
> > > suffering the same GPU falling off the bus problem while exiting
> > > s2idle with external display connected. These laptops connect the
> > > external display via the HDMI/DisplayPort on a USB Type-C interfaced
> > > dock. If we enter and exit s2idle with the dock connected, the
> > > NVIDIA GPU (confirmed on 10de:24b6 and 10de:25b8) and the PCIe port
> > > can come back to D0 w/o problem. If we enter the s2idle, disconnect
> > > the dock, then exit the s2idle, both external display and the panel
> > > will remain with no output. The dmesg as follows shows the "nvidia
> 0000:01:00.0:
> > > can't change power state from D3cold to D0 (config space
> > > inaccessible)" due to the following ACPI error [ 154.446781] [
> > > 154.446783] [ 154.446783] Initialized Local Variables for Method
> > > [IPCS]:
> > > [ 154.446784] Local0: 000000009863e365 <Obj> Integer
> > > 00000000000009C5 [ 154.446790] [ 154.446791] Initialized Arguments
> > > for Method [IPCS]: (7 arguments defined for method invocation) [
> > > 154.446792] Arg0: 0000000025568fbd <Obj> Integer 00000000000000AC [
> > > 154.446795] Arg1: 000000009ef30e76 <Obj> Integer 0000000000000000 [
> > > 154.446798] Arg2: 00000000fdf820f0 <Obj> Integer 0000000000000010 [
> > > 154.446801] Arg3: 000000009fc2a088 <Obj> Integer 0000000000000001 [
> > > 154.446804] Arg4: 000000003a3418f7 <Obj> Integer 0000000000000001 [
> > > 154.446807] Arg5: 0000000020c4b87c <Obj> Integer 0000000000000000 [
> > > 154.446810] Arg6: 000000008b965a8a <Obj> Integer 0000000000000000 [
> > > 154.446813] [ 154.446815] ACPI Error: Aborting method \IPCS due to
> > > previous error
> > > (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529) [ 154.446824] ACPI
> > > Error: Aborting method \MCUI due to previous error
> > > (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529) [ 154.446829] ACPI
> > > Error: Aborting method \SPCX due to previous error
> > > (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529) [ 154.446835] ACPI
> > > Error: Aborting method \_SB.PC00.PGSC due to previous error
> > > (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529) [ 154.446841] ACPI
> > > Error: Aborting method \_SB.PC00.PGON due to previous error
> > > (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529) [ 154.446846] ACPI
> > > Error: Aborting method \_SB.PC00.PEG1.NPON due to previous error
> > > (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529) [ 154.446852] ACPI
> > > Error: Aborting method \_SB.PC00.PEG1.PG01._ON due to previous error
> > > (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529) [ 154.446860] acpi
> > > device:02: Failed to change power state to D0 [ 154.690760] video
> > > LNXVIDEO:00: Cannot transition to power state D0 for parent in
> > > (unknown)
> >
> > If I were to guess, I would say that AML tries to access memory that
> > is not accessible while suspended, probably PCI config space.
> >
> > > The IPCS is the last function called from \_SB.PC00.PEG1.PG01._ON
> > > which we expect it to prepare everything before bringing back the
> > > NVIDIA GPU but it's stuck in the infinite loop as described below.
> > > Please refer to
> > > https://gist.github.com/mschiu77/fa4f5a97297749d0d66fe60c1d421c44
> > > for the full DSDT.dsl.
> >
> > The DSDT alone may not be sufficient.
> >
> > Can you please create a bug entry at bugzilla.kernel.org for this
> > issue and attach the full output of acpidump from one of the affected
> > machines to it?  And please let me know the number of the bug.
> >
> > Also please attach the output of dmesg including a suspend-resume
> > cycle including dock disconnection while suspended and the ACPI
> > messages quoted below.
> >
> > >            While (One)
> > >             {
> > >                 If ((!IBSY || (IERR =3D=3D One)))
> > >                 {
> > >                     Break
> > >                 }
> > >
> > >                 If ((Local0 > TMOV))
> > >                 {
> > >                     RPKG [Zero] =3D 0x03
> > >                     Return (RPKG) /* \IPCS.RPKG */
> > >                 }
> > >
> > >                 Sleep (One)
> > >                 Local0++
> > >             }
> > >
> > > And the upstream PCIe port of NVIDIA seems to become inaccessible
> > > due to the messages as follows.
> > > [ 292.746508] pcieport 0000:00:01.0: waiting 100 ms for downstream
> > > link, after activation [ 292.882296] pci 0000:01:00.0: waiting
> > > additional 100 ms to become accessible [ 316.876997] pci
> > > 0000:01:00.0: can't change power state from D3cold to D0 (config
> > > space inaccessible)
> > >
> > > Since the IPCS is the Intel Reference Code and we don't really know
> > > why the never-end loop happens just because we unplug the dock while
> > > the system still stays in s2idle. Can anyone from Intel suggest what
> > > happens here?
> >
> > This list is not the right channel for inquiries related to Intel
> > support, we can only help you as Linux kernel developers in this
> > venue.
> >
> > > And one thing also worth mentioning, if we unplug the display cable
> > > from the dock before entering the s2idle, NVIDIA GPU can come back
> > > w/o problem even if we disconnect the dock before exiting s2idle.
> > > Here's the lspci information
> > > https://gist.github.com/mschiu77/0bfc439d15d52d20de0129b1b2a86dc4
> > > and the dmesg log with ACPI trace_state enabled and dynamic debug on
> > > for drivers/pci/pci.c, drivers/acpi/device_pm.c for the whole s2idle
> > > enter/exit with IPCS timeout.
> > >
> > > Any suggestion would be appreciated. Thanks.
> >
> > First, please use proper Intel support channels for BIOS-related inquir=
ies.
> >
> > Second, please open a bug as suggested above and let's use it for
> > further communication regarding this issue as far as Linux is
> > concerned.
> >
> > Thanks!
>=20
> Thanks for the suggestion. I opened
> https://bugzilla.kernel.org/show_bug.cgi?id=3D212951 and have a new findi=
ng in
> https://bugzilla.kernel.org/show_bug.cgi?id=3D212951#c13. It seems that m=
aybe we
> could do something in the i915 driver during resume to handle the hpd (be=
cause we
> unplug the dock/dongle when
> suspended) at the very beginning. Since it involves HPD, PMC and the BIOS=
, I don't
> know which way I should go to fix this since Windows won't hit this probl=
em.
How about https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915=
-bugs to get also our devs involved better.

>=20
> Please let me know if there's any information missing in the bugzilla.ker=
nel ticket.
> Any suggestions would be appreciated. Thanks
>=20
> Chris
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
