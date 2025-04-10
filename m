Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F96A844A7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D234210E9B7;
	Thu, 10 Apr 2025 13:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MhV8shy/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA8A10E9B8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 13:25:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 53B7C68448;
 Thu, 10 Apr 2025 13:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07835C4CEDD;
 Thu, 10 Apr 2025 13:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744291508;
 bh=w/hA2EdspSQJP++IXwkv/5ZJ8C69eCEb0FigZhSplV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MhV8shy/9zqF1itltltPsw8vZwez1CP9g+mcWy74ZoRgHYK8mucoduvdA64qXY+ff
 u1YfeL6Pm/LsewifU9vFbmoU002IezOvcHxza+Seb4HBJ/e1vNbQdFVlxnBKu2Ylsv
 1TWDWmYTjd+g8axxfLz3CgdVnLKmKD08+tLVn1bNFmklZLKc1rk27/OWYDmQqWzrSi
 hAnFoZK8FVaId+XT4d0IzLhIeSp92FZcePvqcIb0PJL/WnjJsbvfhtJ7K3NHB7vLER
 DTXGllLi/nKs7tAf1D2caxMvwSD1uzX8B7zwyhDVrWDGrvrP8UZG4SviOG1sU0w38+
 YFRXci3ikah2A==
Date: Thu, 10 Apr 2025 08:25:06 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 pablo.sun@mediatek.com, devicetree@vger.kernel.org,
 christophe.jaillet@wanadoo.fr, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, airlied@gmail.com
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Aoly
 Technology Co., Ltd.
Message-ID: <20250410132506.GA3696058-robh@kernel.org>
References: <20250410072456.387562-1-angelogioacchino.delregno@collabora.com>
 <20250410072456.387562-2-angelogioacchino.delregno@collabora.com>
 <174427376178.2916420.18145565077503737797.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <174427376178.2916420.18145565077503737797.robh@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 10, 2025 at 03:29:21AM -0500, Rob Herring (Arm) wrote:
>=20
> On Thu, 10 Apr 2025 09:24:54 +0200, AngeloGioacchino Del Regno wrote:
> > Aoly is a manufacturer of LCD/IPS displays based in Shenzhen,
> > Mainland China.
> >=20
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i=
nterrupt-controller/econet,en751221-intc.example.dtb: interrupt-controller@=
1fb40000 (econet,en751221-intc): 'econet,shadow-interrupts' does not match =
any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpi=
o-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997=
|max8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*'=
, '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-=
audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*=
', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z=
0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abi=
lis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', =
'^acme,.*', '^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^a=
dapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,=
=2E*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '=
^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^a=
llegromicro,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphasc=
ale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^=
amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphe=
nol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic=
,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^a=
pple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arct=
ic,.*', '^arcx,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*'=
, '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '=
^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^athe=
ros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '=
^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*'=
, '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^be=
agle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bla=
ize,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', =
'^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^byte=
dance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^=
cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cat=
alyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*=
', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipide=
a,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^c=
hrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*'=
, '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', =
'^colorfly,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*=
', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*',=
 '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^c=
tera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*',=
 '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^de=
epcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^de=
vantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*',=
 '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg=
,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics=
,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', =
'^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelman=
n,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^ein=
fochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,=
=2E*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,=
=2E*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', =
'^enclustra,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*'=
, '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*=
', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.=
*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '=
^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,=
=2E*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^=
focaltech,.*', '^forlinx,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^=
friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '=
^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '=
^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*'=
, '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus=
,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocont=
roll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplu=
s,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^=
haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*=
', '^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '=
^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^ho=
perf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawe=
i,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^h=
ynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*=
', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', =
'^imi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*',=
 '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.=
*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^i=
nspur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*=
', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', =
'^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^=
jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,=
=2E*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^kam,.*', '^kar=
o,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^=
kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', =
'^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', =
'^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckf=
b,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', =
'^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '=
^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '=
^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liteon,.*', '^li=
tex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '^l=
ontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^lunzn,.*', '^lu=
xul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', =
'^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*=
', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^med=
iatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mell=
anox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mera=
ki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micro=
crystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*'=
, '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^=
mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^m=
iyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mo=
saixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps=
,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,=
=2E*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxi=
cy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,=
=2E*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netro=
n-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^n=
ewvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,.*', '^nl=
t,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatek,.*', '^novtech,.=
*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*',=
 '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^=
olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*',=
 '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembe=
d,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^or=
anth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', =
'^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^pana=
sonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^pervas=
ive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine64,.*', '^piner=
iver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,=
=2E*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*=
', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', =
'^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^=
prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*'=
, '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^q=
nap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtro=
n,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^relfor=
,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^revotics,.*', '^r=
ex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*=
', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', =
'^roseapplepi,.*', '^rve,.*', '^saef,.*', '^samsung,.*', '^samtec,.*', '^sa=
ncloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schne=
ider,.*', '^sciosense,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '=
^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.=
*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*=
', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-li=
nux,.*', '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*=
', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^sil=
ex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^sim=
tek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^s=
irf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs=
,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^soc=
ionext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sour=
ceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*=
', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '=
^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit=
,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack=
,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermi=
cro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*',=
 '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tdo,.*', '^team-s=
ource-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^t=
echwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^t=
esla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', =
'^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*'=
, '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '=
^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.=
*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*=
', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.=
*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*',=
 '^ugoos,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.=
*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vamrs,.*', '^variscit=
e,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^=
videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*',=
 '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^v=
oltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglo=
ng,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^=
wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligea=
r,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^wins=
tar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^=
wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xilly=
bus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnan=
o,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoele=
ctronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptec=
h,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*=
', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkma=
gic,.*', '^zte,.*', '^zyxel,.*', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#

Ignore this.

Rob

