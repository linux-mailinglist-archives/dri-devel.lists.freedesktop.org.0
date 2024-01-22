Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EC183737E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 21:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C0A10EB19;
	Mon, 22 Jan 2024 20:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A296E10EB19
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 20:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1705954009; x=1706558809; i=deller@gmx.de;
 bh=dNelk4kBrgBCghijjRjoFYY9rvEodTp1XYkmBPmw944=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=emBCQ1O0ru/BmVa7w6zgoBRGJwELUQxlnBLGgssxzm38OqV5idIEkViA7b3bkYyl
 LP5VN5uP+nwWtxpW39e30fUDACe55UnSV1lEIu5qDCh7SBDOf8cAHWRASGFsLgSm4
 4A1KeNjkeXGEknBzbYGLmnB3tqKhReJ0UTW0c9emL1a/7Bbcxkv01vT6j29Q0pkSR
 L+Pabf2mRJVpgAqkeSLd7aAVtKQPZXCKJnGwclhLtBxQkAOLLpwvloH1yVx4JTSF6
 4+CQw/+62SdGqkYo8Db3ygW8HniAZ+c3hsFMC52KCySm5G8yE3cnXsQfpXiQoJUrS
 qVxDoegCgF2kn0qFIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.156.47]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDc7-1r7Ahd0JdF-00uZaX; Mon, 22
 Jan 2024 21:01:00 +0100
Message-ID: <00232392-dc40-4790-9278-91df30e50a04@gmx.de>
Date: Mon, 22 Jan 2024 21:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/47] tty: vt: cleanup and documentation
Content-Language: en-US
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org
References: <20240122110401.7289-1-jirislaby@kernel.org>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <20240122110401.7289-1-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+gm3ywaYDIj1z5b8uKNnsDEONVgpeLMuXadHkrhEOpzr6RnNRc7
 MKGXdTFk8i7+n/hahB3Z1Qd8HY06s3puVkp07+cNPf46oh5IMvd3h1bWGRq80KU0k0bugu9
 YObXAsna5CKxrH/v31pd/DN7EvKZxpRVxMGu7Rdl0bJ4eQ/OqbHLZeQ2hFs9tdPdBMSD0qR
 aJAfV/luWPLKrCuWbAFLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W6afzeAzsUQ=;KIeiULss6b6OVq2p1NenSE5QXXh
 Db076iJ1osuIE1gfnKmrR5TqmTYoyWTVrmLdpAhk4upiNRMjFH/4u4S74yYy3RtnSZ9YVVbow
 jMtGWhK4mVForDhFY5OFVSzAkNdwrv1Y6HufX303YFFr1PSoKDI5+d2LaERlFn0/s8o3J89MI
 JUft1LxdJyeLt8ld4ctY8EzddHo8sBseAv3ZCAhbam6g1R9hgOKeorsg9x2R3tXogVab05tS3
 jgUwzY+Hqxme6+Y+ly2Djrhj5dl9fMwQod357+7aVFCkEhuO+0opuTu9qmY0lGvOCfKFMWzq9
 YP8l4hKICDGV+KCRu0EaBn3hBu6IStpVdOguQArRokk89WikFYSLJCkCFjIFpJTRpnTnW4G9H
 NINEWOyvhwnnI2UKpEwHDYT4dSBWxTTvt670apL2uJKKhKJmHgWPtiAJeK+RtcQyGKDtpjd7S
 M7AkhscNzxDAlbX9og5ZtNelVIxJmByTc5GALNlWr0l3ZtjSjcadzxi0J+YHvnK4f/wR9Jj33
 nTmJLhR12SHi9q41Z2i5iMbVTFgrIT7IyfXkggDZEJYuek92IYaAqJ0PlH4PQylWYafNYhCt8
 98/BPpmuHXo0DkhliSaNR+5dj6Hr2AbHuGC5C1I91I7kmTrm5daDZQt7EHxts3Rb95/2tBZ5x
 Fi/wV1da4ckEs81qAzyc3sIbu/LpaOnhlLFlP62RkvBOqhWvYeBGkHSk+bx1CpLodiCAnkMbO
 82fQbEvcv9K5mNNxEFXAI4zmPGaQ5GwTEbRXpVEiLQIRXud2bcY8P++tah1k6oruI4x72VWvp
 Zs9+AOR+Avf3brOYdarlrQidgTfNpVq1MvrLKcxSv3bvKn/yDVnBJjfkdXjs6XbtnKNykSUrM
 LYMUuFDu4aMzVvAW+odoyZ4hRD2YAFwaDhLD2jolQ4PF4zX7EEyRcMKGxhuYAadMGfUVu6f6B
 jZii/fDbN5Von0+niCII61+0zP4=
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
Cc: Martin Hostettler <textshell@uchuujin.de>, linux-fbdev@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-parisc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/22/24 12:03, Jiri Slaby (SUSE) wrote:
> Push the console code (vt.c, vt.h, console.h, ...) into a bit more
> maintainable state. Especially all around consw structure and document
> it.
>
> CSI parser is also a bit cleaned up. More to follow some time in the
> next round.

I've not yet looked through all of those patches, but I
tried to boot up a machine with the STI console driver
and I've not seen any issues yet.
So far:

Tested-by: Helge Deller <deller@gmx.de> # parisc STI console

Helge

> [v2] See respective patches for changes. The major changes:
>   * vesa.h introduced
>   * parameters of csi*() simplified
>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Helge Deller <deller@gmx.de>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: Martin Hostettler <textshell@uchuujin.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>
> Jiri Slaby (SUSE) (47):
>
>    vgacon: inline vc_scrolldelta_helper() into vgacon_scrolldelta()
>    fbcon: make display_desc a static array in fbcon_startup()
>    tty: vt: fix 20 vs 0x20 typo in EScsiignore
>    tty: vt: expect valid vc when in tty ops
>    tty: vt: pass proper pointers from tioclinux()
>    tty: vt: push console lock from tioclinux() down to 2 functions
>    tty: vt: pass vc_resize_user as a parameter
>    tty: vt: make vc_is_sel()'s vc const
>    tty: vt: define an enum for CSI+m codes
>    tty: vt: use case ranges for CSI+m fg/bg colors
>    tty: vt: define an enum for CSI+J codes
>    tty: vt: reflow csi_J()
>    use clamp() for counts in csi_?() handlers
>    don't pass vc->vc_par[0] to csi_?() handlers
>    tty: vt: define an enum for CSI+K codes
>    tty: vt: reflow csi_K()
>    tty: vt: define an enum for ascii characters
>    tty: vt: remove extern from functions in selection.h
>    tty: vt: make consw::con_debug_*() return void
>    tty: vt: make init parameter of consw::con_init() a bool
>    tty: vt: sanitize arguments of consw::con_clear()
>    tty: vt: remove checks for count in consw::con_clear() implementation=
s
>    tty: vt: add con_putc() helper
>    tty: vt: eliminate unneeded consw::con_putc() implementations
>    tty: vt: sanitize consw::con_putc() parameters
>    tty: vt: sanitize consw::con_putcs() parameters
>    consoles: use if instead of switch-case in consw::con_cursor()
>    fbdev/core: simplify cursor_state setting in fbcon_ops::cursor()
>    tty: vt: remove CM_* constants
>    tty: vt: make consw::con_switch() return a bool
>    tty: vt: stop using -1 for blank mode in consw::con_blank()
>    tty: vt: define a common enum for VESA blanking constants
>    tty: vt: use VESA blanking constants
>    tty: vt: use enum constants for VESA blanking modes
>    tty: vt: make types around consw::con_blank() bool
>    tty: vt: make font of consw::con_font_set() const
>    tty: vt: make consw::con_font_default()'s name const
>    tty: vt: change consw::con_set_origin() return type
>    fbcon: remove consw::con_screen_pos()
>    tty: vt: remove consw::con_screen_pos()
>    tty: vt: make types of screenpos() more consistent
>    fbcon: remove fbcon_getxy()
>    tty: vt: remove consw::con_getxy()
>    tty: vt: remove unused consw::con_flush_scrollback()
>    tty: vt: document the rest of struct consw
>    tty: vt: fix up kernel-doc
>    Documentation: add console.rst
>
>   Documentation/driver-api/tty/console.rst |  45 ++
>   Documentation/driver-api/tty/index.rst   |   1 +
>   drivers/tty/vt/selection.c               |  43 +-
>   drivers/tty/vt/vt.c                      | 645 +++++++++++------------
>   drivers/tty/vt/vt_ioctl.c                |   6 +-
>   drivers/video/console/dummycon.c         |  38 +-
>   drivers/video/console/mdacon.c           |  43 +-
>   drivers/video/console/newport_con.c      |  69 +--
>   drivers/video/console/sticon.c           |  79 ++-
>   drivers/video/console/vgacon.c           | 152 +++---
>   drivers/video/fbdev/core/bitblit.c       |  13 +-
>   drivers/video/fbdev/core/fbcon.c         | 123 ++---
>   drivers/video/fbdev/core/fbcon.h         |   4 +-
>   drivers/video/fbdev/core/fbcon_ccw.c     |  13 +-
>   drivers/video/fbdev/core/fbcon_cw.c      |  13 +-
>   drivers/video/fbdev/core/fbcon_ud.c      |  13 +-
>   drivers/video/fbdev/core/tileblit.c      |   4 +-
>   include/linux/console.h                  | 124 +++--
>   include/linux/console_struct.h           |   1 -
>   include/linux/selection.h                |  56 +-
>   include/linux/vt_kern.h                  |  12 +-
>   include/uapi/linux/fb.h                  |   8 +-
>   include/uapi/linux/vesa.h                |  18 +
>   23 files changed, 755 insertions(+), 768 deletions(-)
>   create mode 100644 Documentation/driver-api/tty/console.rst
>   create mode 100644 include/uapi/linux/vesa.h
>

