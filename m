Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3FD67B24E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 13:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0452E10E7AD;
	Wed, 25 Jan 2023 12:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 420 seconds by postgrey-1.36 at gabe;
 Wed, 25 Jan 2023 04:11:07 UTC
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE8310E314
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 04:11:07 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230125040404epoutp02aa21f801c86337ccbb90e8b18b00ca90~9cYNAqjnP1432514325epoutp02i
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 04:04:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230125040404epoutp02aa21f801c86337ccbb90e8b18b00ca90~9cYNAqjnP1432514325epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1674619445;
 bh=tKo47pbZYVMiR8BWGW14K9nOPkA7uSFy9/Ap7c5WXfE=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=eLX5rRR9sarZeXBI76ITLxthue0Mtro94dO5ojpfZ4RbaiIALLWSxHjrLvFh5fQ//
 th7NL07+4d/C8fJNEaB+w2cVBSXHQmXLUUZ36NFUt5dvI5dcSQ5AnxxRVejJyJsie2
 MPgIzBvUhXKF2CbH4uR1ml8CmhxjzMuUF5Rh9k/w=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230125040404epcas1p1dcd61839e317f873691955dbbcdfa93a~9cYMup9g10195801958epcas1p1b;
 Wed, 25 Jan 2023 04:04:04 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.236]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4P1qw35MbPz4x9Pv; Wed, 25 Jan
 2023 04:04:03 +0000 (GMT)
X-AuditID: b6c32a35-d9fff7000000d8eb-02-63d0aa3302ff
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 F3.79.55531.33AA0D36; Wed, 25 Jan 2023 13:04:03 +0900 (KST)
Mime-Version: 1.0
Subject: RE: [PATCH] PM / devfreq: Fix build issues with devfreq disabled
From: MyungJoo Ham <myungjoo.ham@samsung.com>
To: Rob Clark <robdclark@gmail.com>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20230123153745.3185032-1-robdclark@gmail.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230125040403epcms1p1646e9668b87df3e9c344ad58d39b6eb6@epcms1p1>
Date: Wed, 25 Jan 2023 13:04:03 +0900
X-CMS-MailID: 20230125040403epcms1p1646e9668b87df3e9c344ad58d39b6eb6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIJsWRmVeSWpSXmKPExsWy7bCmnq7xqgvJBt//q1pc//Kc1eLK1/ds
 FnOen2W0OH9+A7vF2aY37BaXd81hs/jce4TRYstqe4trPx8zWzxf+IPZgctjdsNFFo+ds+6y
 e2xa1cnmcb/7OJNH35ZVjB6fN8kFsEVl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpa
 WpgrKeQl5qbaKrn4BOi6ZeYAXaakUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAt
 0CtOzC0uzUvXy0stsTI0MDAyBSpMyM6403+csaBDsWLutGdsDYzTFboYOTkkBEwk3jftYe9i
 5OIQEtjBKPF88R3GLkYODl4BQYm/O4RBaoQFPCWefp3HDmILCShJNNzcxwwR15foeLCNEcRm
 E9CV2LrhLguILSIQIzHjzCdmkJnMAr+ZJDqWHmWFWMYrMaP9KQuELS2xfflWsGZOAWuJa09+
 QdWIStxc/ZYdxn5/bD4jhC0i0XrvLDOELSjx4OduqLiUxJOdk9lAlkkITGaUOHniOCOEM4dR
 YtqGd2wQVfoSZ+aeBLN5BXwlNj+dDraBRUBV4trunVA1LhI3li0H28AsoC2xbOFrZlBIMAto
 SqzfpQ8R5pN497UH7pkd854wQdhqEod2L4E6Wkbi9PSFUId6SPza+hIauk2MEhuuvGabwCg/
 CxHAs5Bsm4WwbQEj8ypGsdSC4tz01GLDAkN4nCbn525iBKdNLdMdjBPfftA7xMjEwXiIUYKD
 WUmEt2f2+WQh3pTEyqrUovz4otKc1OJDjKZAf05klhJNzgcm7rySeEMTSwMTMyNjEwtDM0Ml
 cV5x25PJQgLpiSWp2ampBalFMH1MHJxSDUz6z358mBgwTeajwCqFGZeleCxZZm9rCRHI/aln
 dEvj2p/tLxt0ore0b4pp/fPCmq9mYy7zlP+nZ1c87Vu9ui9NqqFjUp514qv3z9e9XSadmTtn
 tZzm3ZuOBbumbFXOWafXlL92koK+6eM8hf/tJ3zm8hiW85wUnVrBrXHEb5PLhzKLi/NzO/mn
 Ga48YHjNyGvPps/7GDf1PzwT57uffbbc6Y6T/tdzPl94cKdSIeTfph/C9z+6rZCd4bGut0pD
 NvPRYlOn3uv/Ph0uNTix+LjENB3ek7u6zzwq257Cf3umlMamu4xmSw9enMkx7faB5purn9nG
 Kn18fzXh7ONSOYHou2cWaM9oWPRMMf1Pvvyxa0osxRmJhlrMRcWJAEcho5AkBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230123153745epcas1p17e57cf83ed371e86258139473befc615
References: <20230123153745.3185032-1-robdclark@gmail.com>
 <CGME20230123153745epcas1p17e57cf83ed371e86258139473befc615@epcms1p1>
X-Mailman-Approved-At: Wed, 25 Jan 2023 12:06:41 +0000
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
Reply-To: myungjoo.ham@samsung.com
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>Sender : Rob Clark=C2=A0<robdclark=40gmail.com>=0D=0A>Date=20:=202023-01-2=
4=2000:37=20(GMT+9)=0D=0A>Title=20:=20=5BPATCH=5D=20PM=20/=20devfreq:=20Fix=
=20build=20issues=20with=20devfreq=20disabled=0D=0A>=C2=A0=0D=0A>From:=20Ro=
b=20Clark=20<robdclark=40chromium.org>=0D=0A>=0D=0A>The=20existing=20no-op=
=20shims=20for=20when=20PM_DEVFREQ=20(or=20an=20individual=20governor)=0D=
=0A>only=20do=20half=20the=20job.=20=C2=A0The=20governor=20specific=20confi=
g/tuning=20structs=20need=0D=0A>to=20be=20available=20to=20avoid=20compile=
=20errors=20in=20drivers=20using=20devfreq.=0D=0A>=0D=0A>Fixes:=206563f60f1=
4cb=20(=22drm/msm/gpu:=20Add=20devfreq=20tuning=20debugfs=22)=0D=0A>Signed-=
off-by:=20Rob=20Clark=20<robdclark=40chromium.org>=0D=0A=0D=0ADoesn't=20thi=
s=20imply=20that=20DRM_MSM=20should=20depend=20on=20PM_DEVFREQ=20?=0D=0A=0D=
=0AIt=20appears=20that=20gpu/drm/msm/DRM_MSM=20uses=20PM_DEVFREQ=20without=
=20actually=0D=0Adeclaring=20the=20dependency=20on=20PM_DEVFREQ.=0D=0AYou=
=20cannot=20use=20SIMPLE_ONDEMAND=20without=20DEVFREQ.=0D=0A=0D=0ACheers,=
=0D=0AMyungJoo=0D=0A=0D=0A>---=0D=0A>Assuming=20this=20doesn't=20conflict=
=20with=20anything=20else=20landing=20via=20another=0D=0A>tree,=20an=20a-b=
=20to=20land=20this=20via=20drm/msm-next=20would=20let=20us=20un-break=20bu=
ilds.=0D=0A>(And=20also=20start=20removing=20=22select=20DEVFREQ_GOV_SIMPLE=
_ONDEMAND=22s=20added=20in=0D=0A>various=20places=20to=20try=20to=20work=20=
around=20this=20issue.)=0D=0A>=0D=0A>=20include/linux/devfreq.h=20=7C=207=
=20++-----=0D=0A>=201=20file=20changed,=202=20insertions(+),=205=20deletion=
s(-)=0D=0A>=0D=0A>diff=20--git=20a/include/linux/devfreq.h=20b/include/linu=
x/devfreq.h=0D=0A>index=204dc7cda4fd46..7fd704bb8f3d=20100644=0D=0A>---=20a=
/include/linux/devfreq.h=0D=0A>+++=20b/include/linux/devfreq.h=0D=0A>=40=40=
=20-273,8=20+273,8=20=40=40=20void=20devm_devfreq_unregister_notifier(struc=
t=20device=20*dev,=0D=0A>=20struct=20devfreq=20*devfreq_get_devfreq_by_node=
(struct=20device_node=20*node);=0D=0A>=20struct=20devfreq=20*devfreq_get_de=
vfreq_by_phandle(struct=20device=20*dev,=0D=0A>=20=C2=A0=C2=A0=20=C2=A0=20=
=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=
=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0const=20char=20*phandle_nam=
e,=20int=20index);=0D=0A>+=23endif=20/*=20CONFIG_PM_DEVFREQ=20*/=0D=0A>=C2=
=A0=0D=0A>-=23if=20IS_ENABLED(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)=0D=0A>=20=
/**=0D=0A>=20=C2=A0*=20struct=20devfreq_simple_ondemand_data=20-=20=60=60vo=
id=20*data=60=60=20fed=20to=20struct=20devfreq=0D=0A>=20=C2=A0*=20=C2=A0=20=
=C2=A0=20=C2=A0=20=C2=A0and=20devfreq_add_device=0D=0A>=40=40=20-292,9=20+2=
92,7=20=40=40=20struct=20devfreq_simple_ondemand_data=20=7B=0D=0A>=20=C2=A0=
=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0unsigned=20int=20upthreshold;=0D=0A>=20=C2=
=A0=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0unsigned=20int=20downdifferential;=0D=
=0A>=20=7D;=0D=0A>-=23endif=0D=0A>=C2=A0=0D=0A>-=23if=20IS_ENABLED(CONFIG_D=
EVFREQ_GOV_PASSIVE)=0D=0A>=20enum=20devfreq_parent_dev_type=20=7B=0D=0A>=20=
=C2=A0=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0DEVFREQ_PARENT_DEV,=0D=0A>=20=C2=A0=
=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0CPUFREQ_PARENT_DEV,=0D=0A>=40=40=20-337,9=
=20+335,8=20=40=40=20struct=20devfreq_passive_data=20=7B=0D=0A>=20=C2=A0=C2=
=A0=20=C2=A0=20=C2=A0=20=C2=A0struct=20notifier_block=20nb;=0D=0A>=20=C2=A0=
=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0struct=20list_head=20cpu_data_list;=0D=0A>=
=20=7D;=0D=0A>-=23endif=0D=0A>=C2=A0=0D=0A>-=23else=20/*=20=21CONFIG_PM_DEV=
FREQ=20*/=0D=0A>+=23if=20=21defined(CONFIG_PM_DEVFREQ)=0D=0A>=20static=20in=
line=20struct=20devfreq=20*devfreq_add_device(struct=20device=20*dev,=0D=0A=
>=20=C2=A0=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=
=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=
=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0struct=20devfreq_dev_profile=20*prof=
ile,=0D=0A>=20=C2=A0=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=
=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=
=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0const=20char=20*governor_na=
me,=0D=0A>--=20=0D=0A>2.38.1=0D=0A>=0D=0A
